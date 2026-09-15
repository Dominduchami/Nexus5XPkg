#include <Library/BaseLib.h>
#include <Library/IoLib.h>
#include <Library/SerialPortLib.h>
#include <Library/MsmSerialDmPortLib.h>

#define NON_PRINTABLE_ASCII_CHAR  128
#define UART_DM_BASE ((UINT32)BLSP1_UART1_BASE)

//
// Pack up to 4 bytes from Buffer into a single 32-bit FIFO word,
// translating '\n' -> '\r' '\n' the same way msm_boot_uart_dm_write does.
//
static
UINT8
PackCharsIntoWord (
  IN  UINT8   *Buffer,
  IN  UINT8   Count,
  OUT UINT32  *Word
  )
{
  UINT8  NumCharsWritten = 0;
  UINT8  j;

  *Word = 0;

  for (j = 0; j < Count; j++) {
    if (Buffer[NumCharsWritten] == '\n') {
      *Word |= ((UINT32)'\r' & 0xff) << (j * 8);
      Buffer[NumCharsWritten] = NON_PRINTABLE_ASCII_CHAR;
    } else {
      if (Buffer[NumCharsWritten] == NON_PRINTABLE_ASCII_CHAR) {
        Buffer[NumCharsWritten] = '\n';
      }

      *Word |= ((UINT32)Buffer[NumCharsWritten] & 0xff) << (j * 8);
      NumCharsWritten++;
    }
  }

  return NumCharsWritten;
}

//
// Unpack up to 4 bytes out of a 32-bit FIFO word into Buffer.
//
static
VOID
UnpackWordIntoChars (
  IN  UINT32  Word,
  IN  UINT8   Count,
  OUT UINT8   *Buffer
  )
{
  UINT8  j;

  for (j = 0; j < Count; j++) {
    Buffer[j] = (UINT8)((Word >> (j * 8)) & 0xff);
  }
}

RETURN_STATUS
EFIAPI
SerialPortInitialize (
  VOID
  )
{
  UINT32  Base = UART_DM_BASE;

  // Mode registers: no flow control, 8-N-1
  MmioWrite32 (MSM_BOOT_UART_DM_MR1 (Base), 0x0);
  MmioWrite32 (MSM_BOOT_UART_DM_MR2 (Base), MSM_BOOT_UART_DM_8_N_1_MODE);

  MmioWrite32 (MSM_BOOT_UART_DM_IMR (Base), MSM_BOOT_UART_DM_IMR_ENABLED);

  MmioWrite32 (MSM_BOOT_UART_DM_TFWR (Base), MSM_BOOT_UART_DM_TFW_VALUE);
  MmioWrite32 (MSM_BOOT_UART_DM_RFWR (Base), MSM_BOOT_UART_DM_RFW_VALUE);

  MmioWrite32 (MSM_BOOT_UART_DM_IPR (Base), MSM_BOOT_UART_DM_STALE_TIMEOUT_LSB);

  MmioWrite32 (MSM_BOOT_UART_DM_IRDA (Base), 0x0);
  MmioWrite32 (MSM_BOOT_UART_DM_HCR (Base), 0x0);

  // Soft reset
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CMD_RESET_RX);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CMD_RESET_TX);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CMD_RESET_ERR_STAT);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CMD_RES_TX_ERR);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CMD_RES_STALE_INT);

  MmioWrite32 (MSM_BOOT_UART_DM_DMEN (Base), 0x0);

  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CR_RX_ENABLE);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CR_TX_ENABLE);

  // Init RX path (disable/re-enable stale event, arm DMRX watermark)
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_GCMD_DIS_STALE_EVT);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CMD_RES_STALE_INT);
  MmioWrite32 (MSM_BOOT_UART_DM_DMRX (Base), MSM_BOOT_UART_DM_DMRX_DEF_VALUE);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_GCMD_ENA_STALE_EVT);

  return RETURN_SUCCESS;
}

UINTN
EFIAPI
SerialPortWrite (
  IN  UINT8   *Buffer,
  IN  UINTN   NumberOfBytes
  )
{
  UINT32  Base = UART_DM_BASE;
  UINT8   *TxData;
  UINT32  NumOfChars;
  UINT32  TxWordCount;
  UINT32  TxCharLeft;
  UINT32  TxChar;
  UINT32  TxWord;
  UINT8   NumCharsWritten;
  UINT32  i;

  if ((Buffer == NULL) || (NumberOfBytes == 0)) {
    return 0;
  }

  // Account for '\n' -> '\r' '\n' expansion the same way
  // msm_boot_uart_calculate_num_chars_to_write does.
  NumOfChars = 0;
  for (i = 0; i < NumberOfBytes; i++) {
    NumOfChars++;
    if (Buffer[i] == '\n') {
      NumOfChars++;
    }
  }

  TxData = Buffer;

  // Wait for TX FIFO to be empty, then arm NO_CHARS_FOR_TX atomically
  // with clearing the TX_READY interrupt, same ordering as the reference.
  if (!(MmioRead32 (MSM_BOOT_UART_DM_SR (Base)) & MSM_BOOT_UART_DM_SR_TXEMT)) {
    while (!(MmioRead32 (MSM_BOOT_UART_DM_ISR (Base)) & MSM_BOOT_UART_DM_TX_READY)) {
      // busy wait - no timers here
    }
  }

  MmioWrite32 (MSM_BOOT_UART_DM_NO_CHARS_FOR_TX (Base), NumOfChars);
  MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_GCMD_RES_TX_RDY_INT);

  TxWordCount = (NumOfChars % 4) ? ((NumOfChars / 4) + 1) : (NumOfChars / 4);
  TxCharLeft  = NumOfChars;

  for (i = 0; i < TxWordCount; i++) {
    TxChar = (TxCharLeft < 4) ? TxCharLeft : 4;
    NumCharsWritten = PackCharsIntoWord (TxData, (UINT8)TxChar, &TxWord);

    while (!(MmioRead32 (MSM_BOOT_UART_DM_SR (Base)) & MSM_BOOT_UART_DM_SR_TXRDY)) {
      // busy wait for FIFO space
    }

    MmioWrite32 (MSM_BOOT_UART_DM_TF (Base, 0), TxWord);

    TxCharLeft = NumOfChars - (i + 1) * 4;
    TxData    += NumCharsWritten;
  }

  // Drain: block here until the UART has actually finished shifting the
  // last word out onto the wire (TXEMT), not just accepted it into the
  // FIFO (TXRDY). Without this, a subsequent SerialPortWrite() call can
  // reprogram NO_CHARS_FOR_TX / TF while the previous message is still
  // transmitting, which is what produces the single garbled byte followed
  // by the next message running on with no separator.
  while (!(MmioRead32 (MSM_BOOT_UART_DM_SR (Base)) & MSM_BOOT_UART_DM_SR_TXEMT)) {
    // busy wait for full drain
  }

  return NumberOfBytes;
}

UINTN
EFIAPI
SerialPortRead (
  OUT UINT8   *Buffer,
  IN  UINTN   NumberOfBytes
  )
{
  UINT32  Base = UART_DM_BASE;
  UINTN   BytesRead = 0;
  UINT32  Status;
  UINT32  RxWord;
  UINT8   Chunk[4];
  UINT8   ChunkSize;
  UINT8   i;

  if ((Buffer == NULL) || (NumberOfBytes == 0)) {
    return 0;
  }

  while (BytesRead < NumberOfBytes) {
    Status = MmioRead32 (MSM_BOOT_UART_DM_SR (Base));

    if (!(Status & MSM_BOOT_UART_DM_SR_RXRDY)) {
      break; // nothing waiting right now - non-blocking read
    }

    if (Status & MSM_BOOT_UART_DM_SR_UART_OVERRUN) {
      // Overrun is reported out of band, same as the reset-error handling
      // used on the TX side and in the reference reset routine.
      MmioWrite32 (MSM_BOOT_UART_DM_CR (Base), MSM_BOOT_UART_DM_CMD_RESET_ERR_STAT);
    }

    RxWord    = MmioRead32 (MSM_BOOT_UART_DM_RF (Base, 0));
    ChunkSize = (UINT8)((NumberOfBytes - BytesRead) < 4 ? (NumberOfBytes - BytesRead) : 4);

    UnpackWordIntoChars (RxWord, ChunkSize, Chunk);

    for (i = 0; i < ChunkSize; i++) {
      Buffer[BytesRead++] = Chunk[i];
    }
  }

  return BytesRead;
}

BOOLEAN
EFIAPI
SerialPortPoll (
  VOID
  )
{
  return (MmioRead32 (MSM_BOOT_UART_DM_SR (UART_DM_BASE)) & MSM_BOOT_UART_DM_SR_RXRDY) != 0;
}