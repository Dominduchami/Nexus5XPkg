#include <Library/BaseLib.h>
#include <Library/DebugLib.h>
#include <Library/IoLib.h>
#include <Library/PcdLib.h>
#include <Library/SerialPortLib.h>

#include <Library/MemoryMapHelperLib.h>
#include <Library/PlatformPrePiLib.h>

#include "InitializationUtils.h"

VOID InitializeSharedUartBuffers(VOID)
{
  ARM_MEMORY_REGION_DESCRIPTOR_EX DisplayMemoryRegion;
  LocateMemoryMapAreaByName("Display Reserved", &DisplayMemoryRegion);

  // Setup Position counter
  INTN *pFbConPosition =
      (INTN
           *)(DisplayMemoryRegion.Address + (FixedPcdGet32(PcdMipiFrameBufferWidth) * FixedPcdGet32(PcdMipiFrameBufferHeight) * FixedPcdGet32(PcdMipiFrameBufferPixelBpp) / 8));

  *(pFbConPosition + 0) = 0;
  *(pFbConPosition + 1) = 0;
}

VOID MemoryTest(VOID)
{
  // RAM Sanity testing begins here.
  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx = gDeviceMemoryDescriptorEx;

  DEBUG((EFI_D_ERROR, "Testing RAM. Please wait.\n"));

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    if (MemoryDescriptorEx->HobOption == AddMem &&
        MemoryDescriptorEx->ResourceType == SYS_MEM &&
        MemoryDescriptorEx->ResourceAttribute == (SYS_MEM_CAP) &&
        (MemoryDescriptorEx->MemoryType == Conv ||
         MemoryDescriptorEx->MemoryType == BsData ||
         MemoryDescriptorEx->MemoryType == RtData) &&
        AsciiStriCmp("DBI Dump", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("UEFI FD", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("CPU Vectors", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("UEFI Stack", MemoryDescriptorEx->Name) != 0) {

      DEBUG((EFI_D_ERROR, "Testing %a. Please wait.\n", MemoryDescriptorEx->Name));

      for (UINT64 i = 0; i < MemoryDescriptorEx->Length; i += sizeof(UINT64)) {
        MmioWrite64(MemoryDescriptorEx->Address + i, 0);
      }

      DEBUG((EFI_D_ERROR, "Testing %a is finished.\n", MemoryDescriptorEx->Name));
    }
    MemoryDescriptorEx++;
  }

  DEBUG((EFI_D_ERROR, "Testing RAM is finished.\n"));
}

VOID UartInit(VOID)
{
  SerialPortInitialize();
  InitializeSharedUartBuffers();

  DEBUG((EFI_D_INFO, "\nProject Mu on Surface Duo (AArch64)\n"));
  DEBUG(
      (EFI_D_INFO, "Firmware version %s built %a %a\n\n",
       (CHAR16 *)PcdGetPtr(PcdFirmwareVersionString), __TIME__, __DATE__));
}

VOID EarlyInitialization(VOID)
{
  // Do platform specific initialization here
  PlatformInitialize();

  // Initialize UART Serial
  UartInit();

  MemoryTest();
  CpuDeadLoop();
}
