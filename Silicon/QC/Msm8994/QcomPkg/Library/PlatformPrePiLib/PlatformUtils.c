#include <PiPei.h>
#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/IoLib.h>
#include <Library/PlatformPrePiLib.h>
#include "PlatformUtils.h"

#include <IndustryStandard/ArmStdSmc.h>
#include <Library/ArmHvcLib.h>
#include <Library/ArmSmcLib.h>

#include <Chipset/mdp5.h>
#include <Platform/iomap.h>

#include "HvcPatch.h"

STATIC VOID PsciFixupInit(VOID)
{
  EFI_PHYSICAL_ADDRESS WakeFromPowerGatePatchOffset;
  EFI_PHYSICAL_ADDRESS LowerELSynchronous64PatchOffset;
  EFI_PHYSICAL_ADDRESS LowerELSynchronous32PatchOffset;
  ARM_HVC_ARGS         StubArgsHvc;
  ARM_SMC_ARGS         StubArgsSmc;

  WakeFromPowerGatePatchOffset    = WAKE_FROM_POWERGATE_PATCH_ADDR;
  LowerELSynchronous64PatchOffset = LOWER_EL_SYNC_EXC_64B_PATCH_ADDR;
  LowerELSynchronous32PatchOffset = LOWER_EL_SYNC_EXC_32B_PATCH_ADDR;

  CopyMem(
      (VOID *)WakeFromPowerGatePatchOffset, WakeFromPowerGatePatchHandler,
      sizeof(WakeFromPowerGatePatchHandler));
  CopyMem(
      (VOID *)LowerELSynchronous64PatchOffset, LowerELSynchronous64PatchHandler,
      sizeof(LowerELSynchronous64PatchHandler));
  CopyMem(
      (VOID *)LowerELSynchronous32PatchOffset, LowerELSynchronous32PatchHandler,
      sizeof(LowerELSynchronous32PatchHandler));

  ArmDataSynchronizationBarrier();
  ArmInvalidateDataCache();
  ArmInvalidateInstructionCache();

  // Call into the handler to make HCR_EL2.TSC sticky
  StubArgsHvc.Arg0 = ARM_SMC_ID_PSCI_VERSION;
  ArmCallHvc(&StubArgsHvc);

  // Well...
  StubArgsSmc.Arg0 = ARM_SMC_ID_PSCI_VERSION;
  ArmCallSmc(&StubArgsSmc);
}

BOOLEAN IsLinuxBootRequested(VOID)
{
  return FALSE;
}

VOID CheckMdpConfig(VOID)
{
  /* Windows requires a BGRA FB */
  DEBUG((EFI_D_INFO, "\nChanging FB format\n"));
  MmioWrite32(PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000236FF);
  MmioWrite32(PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);

  DEBUG((EFI_D_INFO, "\nChanging FB stride\n"));
  MmioWrite32(PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, 1080*4);
  MmioWrite32(MDP_CTL_0_BASE + CTL_FLUSH, (1 << (3)));
}

STATIC
VOID
DisplayEnableRefresh(VOID)
{
  MmioWrite32(MDP_REG_PP_0_AUTOREFRESH_CONFIG, ((1 << (31)) | AUTOREFRESH_FRAMENUM));
  ArmDataSynchronizationBarrier();
};

VOID PlatformInitialize(VOID)
{
  QGicPeim();

  CheckMdpConfig();

  DisplayEnableRefresh();
}