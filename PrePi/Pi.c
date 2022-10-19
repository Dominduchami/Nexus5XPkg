// Pi.c: Entry point for SEC(Security).

#include "Pi.h"
#include "HvcPatch.h"

#include <Pi/PiBootMode.h>
#include <Pi/PiHob.h>
#include <PiDxe.h>
#include <PiPei.h>

#include <Guid/LzmaDecompress.h>
#include <Ppi/GuidedSectionExtraction.h>

#include <Library/ArmLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/CacheMaintenanceLib.h>
#include <Library/DebugAgentLib.h>
#include <Library/DebugLib.h>
#include <Library/HobLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/LKEnvLib.h>
#include <Library/PeCoffGetEntryPointLib.h>
#include <Library/PerformanceLib.h>
#include <Library/PrePiHobListPointerLib.h>
#include <Library/PrePiLib.h>
#include <Library/PlatformPrePiLib.h>
#include <Library/SerialPortLib.h>

#include <IndustryStandard/ArmStdSmc.h>
#include <Library/ArmHvcLib.h>
#include <Library/ArmSmcLib.h>

#include <Chipset/psci.h>

VOID EFIAPI ProcessLibraryConstructorList(VOID);

STATIC VOID PsciTest(VOID)
{
  ARM_HVC_ARGS         StubArgsHvc;

  DEBUG((EFI_D_INFO, "PSCI Test\n"));

  StubArgsHvc.Arg0 = ARM_SMC_ID_PSCI_VERSION;
  ArmCallHvc(&StubArgsHvc);

  if (StubArgsHvc.Arg0 == ARM_SMC_PSCI_RET_INVALID_PARAMS) {
    DEBUG((EFI_D_INFO, "PSCI call returned invalid parameters!\n"));
  }

  else if (StubArgsHvc.Arg0 == ARM_SMC_PSCI_RET_NOT_SUPPORTED) {
    DEBUG((EFI_D_INFO, "PSCI call returned : not supported!\n"));
  }

  else {
    DEBUG((EFI_D_INFO | EFI_D_LOAD, "PSCI - v%d.%d detected\n", 
          PSCI_VERSION_MAJOR(StubArgsHvc.Arg0), PSCI_VERSION_MINOR(StubArgsHvc.Arg0)));
  }
}

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

  DEBUG((EFI_D_INFO, "\nPSCI Fixup Init\n"));

  CopyMem(
      (VOID *)WakeFromPowerGatePatchOffset, WakeFromPowerGatePatchHandler,
      sizeof(WakeFromPowerGatePatchHandler));

  DEBUG((EFI_D_INFO, "First CopyMem done\n"));

  CopyMem(
      (VOID *)LowerELSynchronous64PatchOffset, LowerELSynchronous64PatchHandler,
      sizeof(LowerELSynchronous64PatchHandler));

  DEBUG((EFI_D_INFO, "Second CopyMem done\n"));

  CopyMem(
      (VOID *)LowerELSynchronous32PatchOffset, LowerELSynchronous32PatchHandler,
      sizeof(LowerELSynchronous32PatchHandler));

  DEBUG((EFI_D_INFO, "Third CopyMem done\n"));

  ArmDataSynchronizationBarrier();
  ArmInvalidateDataCache();
  ArmInvalidateInstructionCache();

  DEBUG((EFI_D_INFO, "Barriers done\n"));

  DEBUG((EFI_D_INFO, "Call into the handler to make HCR_EL2.TSC sticky\n"));
  // Call into the handler to make HCR_EL2.TSC sticky
  StubArgsHvc.Arg0 = ARM_SMC_ID_PSCI_VERSION;
  ArmCallHvc(&StubArgsHvc);

  DEBUG((EFI_D_INFO, "HVC call done\n"));

  // Well...
  DEBUG((EFI_D_INFO, "Call SMC\n"));

  StubArgsSmc.Arg0 = ARM_SMC_ID_PSCI_VERSION;
  ArmCallSmc(&StubArgsSmc);

  DEBUG((EFI_D_INFO, "SMC call done\n"));
}

VOID PrePiMain(IN VOID *StackBase, IN UINTN StackSize)
{

  EFI_HOB_HANDOFF_INFO_TABLE *HobList;
  EFI_STATUS                  Status;

  UINTN MemoryBase       = 0;
  UINTN MemorySize       = 0;
  UINTN UefiMemoryBase   = 0;
  UINTN UefiMemorySize   = 0;

  //PSCI test
  PsciTest();

  // PSCI fixup init
  PsciFixupInit();

  // Architecture-specific initialization
  // Enable Floating Point
  ArmEnableVFP();

  /* Enable program flow prediction, if supported */
  ArmEnableBranchPrediction();

  // Declare UEFI region
  MemoryBase     = FixedPcdGet32(PcdSystemMemoryBase);
  MemorySize     = FixedPcdGet32(PcdSystemMemorySize);
  UefiMemoryBase = MemoryBase + FixedPcdGet32(PcdPreAllocatedMemorySize);
  UefiMemorySize = FixedPcdGet32(PcdUefiMemPoolSize);
  StackBase      = (VOID *)(UefiMemoryBase + UefiMemorySize - StackSize);

  DEBUG(
      (EFI_D_INFO | EFI_D_LOAD,
       "UEFI Memory Base = 0x%llx, Size = 0x%llx, Stack Base = 0x%llx, Stack "
       "Size = 0x%llx\n",
       UefiMemoryBase, UefiMemorySize, StackBase, StackSize));

  // Set up HOB
  HobList = HobConstructor(
      (VOID *)UefiMemoryBase, UefiMemorySize, (VOID *)UefiMemoryBase,
      StackBase);

  PrePeiSetHobList(HobList);

  // Invalidate cache
  InvalidateDataCacheRange(
      (VOID *)(UINTN)PcdGet64(PcdFdBaseAddress), PcdGet32(PcdFdSize));

  // Initialize MMU
  Status = MemoryPeim(UefiMemoryBase, UefiMemorySize);

  if (EFI_ERROR(Status)) {
    DEBUG((EFI_D_ERROR, "Failed to configure MMU\n"));
    CpuDeadLoop();
  }

  DEBUG((EFI_D_LOAD | EFI_D_INFO, "MMU configured from device config\n"));

  // Initialize GIC
  if (!FixedPcdGetBool(PcdIsLkBuild)) {
    Status = QGicPeim();

    if (EFI_ERROR(Status)) {
      DEBUG((EFI_D_ERROR, "Failed to configure GIC\n"));
      CpuDeadLoop();
    }
  }

  // Add HOBs
  BuildStackHob((UINTN)StackBase, StackSize);

  // TODO: Call CpuPei as a library
  BuildCpuHob(ArmGetPhysicalAddressBits(), PcdGet8(PcdPrePiCpuIoSize));

  // Set the Boot Mode
  SetBootMode(BOOT_WITH_FULL_CONFIGURATION);

  // Initialize Platform HOBs (CpuHob and FvHob)
  Status = PlatformPeim();
  ASSERT_EFI_ERROR(Status);

  // Install SoC driver HOBs
  //InstallPlatformHob();

  // Now, the HOB List has been initialized, we can register performance
  // information PERF_START (NULL, "PEI", NULL, StartTimeStamp);

  // SEC phase needs to run library constructors by hand.
  ProcessLibraryConstructorList();

  // Assume the FV that contains the PI (our code) also contains a compressed
  // FV.
  Status = DecompressFirstFv();
  ASSERT_EFI_ERROR(Status);

  // Load the DXE Core and transfer control to it
  Status = LoadDxeCoreFromFv(NULL, 0);
  ASSERT_EFI_ERROR(Status);

  // We should never reach here
  CpuDeadLoop();
}

VOID
CEntryPoint(
  IN VOID *StackBase, 
  IN UINTN StackSize
  )
{
  // Do platform specific initialization here
  PlatformInitialize();

  // Goto primary Main.
  PrePiMain(StackBase, StackSize);

  // DXE Core should always load and never return
  ASSERT(FALSE);
}