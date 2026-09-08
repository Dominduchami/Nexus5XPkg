#include <Library/PcdLib.h>
#include <Library/ArmLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/DebugLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/HobLib.h>
#include <Library/SerialPortLib.h>
#include <Library/PrintLib.h>
#include <Library/BaseLib.h>

#include <IndustryStandard/ArmStdSmc.h>
#include <Library/ArmSmcLib.h>
#include <Library/PlatformPrePiLib.h>

#include "PlatformUtils.h"
#include <Configuration/DeviceMemoryMap.h>

#include <Chipset/mdp5.h>

#include <Platform/iomap.h>

EFI_STATUS
EFIAPI
SerialPortLocateArea(PARM_MEMORY_REGION_DESCRIPTOR_EX* MemoryDescriptor)
{
  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx =
      gDeviceMemoryDescriptorEx;

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    if (AsciiStriCmp("PStore", MemoryDescriptorEx->Name) == 0) {
      *MemoryDescriptor = MemoryDescriptorEx;
      return EFI_SUCCESS;
    }
    MemoryDescriptorEx++;
  }

  return EFI_NOT_FOUND;
}

VOID InitializeSharedUartBuffers(VOID)
{
#if USE_MEMORY_FOR_SERIAL_OUTPUT == 1
  PARM_MEMORY_REGION_DESCRIPTOR_EX PStoreMemoryRegion = NULL;
#endif

  INTN* pFbConPosition = (INTN*)(FixedPcdGet32(PcdMipiFrameBufferAddress) + (FixedPcdGet32(PcdMipiFrameBufferWidth) * 
                                                                              FixedPcdGet32(PcdMipiFrameBufferHeight) * 
                                                                              FixedPcdGet32(PcdMipiFrameBufferPixelBpp) / 8));

  *(pFbConPosition + 0) = 0;
  *(pFbConPosition + 1) = 0;

#if USE_MEMORY_FOR_SERIAL_OUTPUT == 1
  // Clear PStore area
  SerialPortLocateArea(&PStoreMemoryRegion);
  UINT8 *base = (UINT8 *)PStoreMemoryRegion->Address;
  for (UINTN i = 0; i < PStoreMemoryRegion->Length; i++) {
    base[i] = 0;
  }
#endif
}

STATIC VOID UartInit(VOID)
{
  SerialPortInitialize();
  InitializeSharedUartBuffers();

  DEBUG((EFI_D_INFO, "\nTianoCore on Nexus 5X (AArch64)\n"));
  DEBUG(
      (EFI_D_INFO, "Firmware version %s built %a %a\n\n",
       (CHAR16 *)PcdGetPtr(PcdFirmwareVersionString), __TIME__, __DATE__));
}

/* 
 * Reconfigure the framebuffer to a BGRA 32bpp one (windows requirements)
 *
 * Uses code from https://imbushuo.net/blog/archives/590/ (Little-kernel section)
 * 
 * TODO: Dynamically detect pipes
 */
VOID CheckMdpConfig(VOID)
{
  UINT32 Width = FixedPcdGet32(PcdMipiFrameBufferWidth);

#if SILICON_PLATFORM == 8992
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000236FF);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, Width * 4);
  MmioWrite32(MDP_CTL_0_BASE + CTL_FLUSH, (1 << (3)));
#else
  /* Angler uses dual-pipe framebuffer */
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000237FF);
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, Width * 4);
  MmioWrite32(MDP_CTL_0_BASE + CTL_FLUSH, (1 << (0)));

  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_FORMAT, 0x000237FF);
  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_YSTRIDE, Width * 4);
  MmioWrite32(MDP_CTL_1_BASE + CTL_FLUSH, (1 << (1)));
#endif
}

/* 
 * Turn on autorefresh on command-mode panels 
 * (stock bootloader disables it here).
 *
 * Based on lk2nd code :
 * https://github.com/msm8916-mainline/lk2nd/pull/137/commits/d0492fdd1f5e6ff51a181fd6d4920c62adc1a23e#diff-c75b4efb45794d329b2414b12f0a97190c5fe0d9dd43f33e84969e1c34f5ca99R158
 */
STATIC
VOID
DisplayEnableRefresh(VOID)
{
#if SILICON_PLATFORM == 8994
  UINT32 Height = FixedPcdGet32(PcdMipiFrameBufferHeight);
  UINT32 VsyncCount = 19200000 / (Height * 60);
#endif
  UINT32 MdssMdpRev = MmioRead32(MDP_HW_REV);
  UINT32 pp0_base;

  if (MdssMdpRev >= MDSS_MDP_HW_REV_105)
    pp0_base = REG_MDP(0x71000);
  else if (MdssMdpRev >= MDSS_MDP_HW_REV_102)
    pp0_base = REG_MDP(0x12D00);
  else
    pp0_base = REG_MDP(0x21B00);

#if SILICON_PLATFORM == 8994
  /* Only needed for angler, bullhead has it enabled already */
  MmioWrite32(pp0_base + MDP_PP_SYNC_CONFIG_VSYNC, VsyncCount | BIT(19));
#endif

  /* Enable autorefresh and flush */
  MmioWrite32(pp0_base + MDP_PP_AUTOREFRESH_CONFIG, BIT(31) | AUTOREFRESH_FRAMENUM);
  MmioWrite32(MDP_CTL_0_BASE + CTL_START, 1);
}

VOID PlatformInitialize()
{
  UartInit();

  /* Change the config for Windows */
  CheckMdpConfig();

  /* Display refresh gets disabled by the stock bootloader.
  Enable it so that we'll get a proper framebuffer */
  DisplayEnableRefresh();
}