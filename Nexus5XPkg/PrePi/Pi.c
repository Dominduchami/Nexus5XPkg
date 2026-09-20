// Pi.c: Entry point for SEC(Security).

#include "Pi.h"

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
#include <Library/PeCoffGetEntryPointLib.h>
#include <Library/PerformanceLib.h>
#include <Library/PrePiHobListPointerLib.h>
#include <Library/PrePiLib.h>
#include <Library/PlatformPrePiLib.h>
#include <Library/SerialPortLib.h>

#include <Library/ArmHvcLib.h>
#include <Library/ArmSmcLib.h>

#include <IndustryStandard/ArmStdSmc.h>

#include <Library/LKEnvLib.h>
#include "CpuBoot/CpuBoot.h"

VOID EFIAPI ProcessLibraryConstructorList(VOID);
extern void SecondaryCpuEntry();

static UINT32 ProcessorIdMapping[6] = {
    0x00000000, 0x00000001, 0x00000002, 0x00000003,
    0x00000100, 0x00000101,
};

VOID SetupMpPark()
{
  /* Launch all CPUs
   * - boot cpus
   * - set boot adress to &SecondaryCpuEntry (cpu_boot_set_addr in lk2nd?)
   */
  //                          &SecondaryCpuEntry, BOOT_ARM64
  //ret = cpu_boot_set_addr((uintptr_t)smp->code, boot_type & BOOT_ARM64);
  //      -> boot_and_setup_cpu(dtb, node, cpus, smp);
  //            -> cpu_boot(dtb, cpu, mpidr);
  //
  //https://github.com/fekz115/lk2nd/blob/5d53e48a4829cb52245b5c09fe98ea418b4dbfff/lk2nd/smp/cpu-boot.c#L68

    /* Prepare spin table memory */
    //???
    //ret = cpu_boot_set_addr((uintptr_t)smp->code, boot_type & BOOT_ARM64);
  UINT32 MpIdr = ArmReadMpidr();

	if ( 
    cpu_boot_set_addr(
      (UINTN)&SecondaryCpuEntry, 
      BOOT_ARM64)
   )  
  {
    DEBUG((EFI_D_LOAD | EFI_D_INFO, "Failed to set CPU boot address\n"));
		for(;;) {}; // Boot failed
	}
  DEBUG((EFI_D_LOAD | EFI_D_INFO, "CPU boot address set!\n"));

    // Launch all CPUs
  if ( MpIdr == 0x80000000) {
    for (UINTN i = 2; i < 6; i++) {//1
      DEBUG((EFI_D_LOAD | EFI_D_INFO, "Launching cpu %d\n", i));
        //if (!cpu_boot(NULL, CpuNum, mpidr))
        //if (!cpu_boot_cortex_a_msm8994(mpidr)) {
        if (!cpu_boot(i, MpIdr)) {
            DEBUG((EFI_D_LOAD | EFI_D_INFO, "Launching cpu %d FAIL!\n", i));
            return;
        }
    }
  }
}

VOID PrePiMain(IN VOID *StackBase, IN UINTN StackSize)
{

  EFI_HOB_HANDOFF_INFO_TABLE *HobList;
  EFI_STATUS                  Status;

  UINTN MemoryBase       = 0;
  UINTN MemorySize       = 0;
  UINTN UefiMemoryBase   = 0;
  UINTN UefiMemorySize   = 0;

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

  DEBUG((EFI_D_LOAD | EFI_D_INFO, "Launching CPUs\n"));

  // Launch all CPUs
  /*if (ArmReadMpidr() == 0x80000000) {
    for (UINTN i = 1; i < 6; i++) {
      ARM_HVC_ARGS ArmHvcArgs;
      ArmHvcArgs.Arg0 = ARM_SMC_ID_PSCI_CPU_ON_AARCH64;
      ArmHvcArgs.Arg1 = ProcessorIdMapping[i];
      ArmHvcArgs.Arg2 = (UINTN)&SecondaryCpuEntry;
      ArmHvcArgs.Arg3 = i;

      ArmCallHvc(&ArmHvcArgs);
      ASSERT(ArmHvcArgs.Arg0 == ARM_SMC_PSCI_RET_SUCCESS);
    }
  }*/

  SetupMpPark();

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

VOID SecondaryCEntryPoint(IN UINTN Index)
{
  ASSERT(Index >= 1 && Index <= 5);

  EFI_PHYSICAL_ADDRESS MailboxAddress =
      FixedPcdGet64(SecondaryCpuMpParkRegionBase) + 0x10000 * Index + 0x1000;
  PEFI_PROCESSOR_MAILBOX pMailbox =
      (PEFI_PROCESSOR_MAILBOX)(VOID *)MailboxAddress;

  UINT32 CurrentProcessorId = 0;
  VOID (*SecondaryStart)(VOID * pMailbox);
  UINTN SecondaryEntryAddr;
  UINTN InterruptId;
  UINTN AcknowledgeInterrupt;

  // MMU, cache and branch predicton must be disabled
  // Cache is disabled in CRT startup code
  ArmDisableMmu();
  ArmDisableBranchPrediction();

  // Turn on GIC CPU interface as well as SGI interrupts
  ArmGicEnableInterruptInterface(FixedPcdGet64(PcdGicInterruptInterfaceBase));
  MmioWrite32(FixedPcdGet64(PcdGicInterruptInterfaceBase) + 0x4, 0xf0);

  // But turn off interrupts
  ArmDisableInterrupts();

  // Clear mailbox
  pMailbox->JumpAddress = 0;
  pMailbox->ProcessorId = 0xffffffff;
  CurrentProcessorId    = ProcessorIdMapping[Index];

  do {
    // ArmDataSynchronizationBarrier();
    // DEBUG((EFI_D_ERROR, "%d: WFI \n", Index));
    // ArmCallWFI();
    // DEBUG((EFI_D_ERROR, "%d: end WFI \n", Index));
    ArmDataSynchronizationBarrier();

    if (pMailbox->ProcessorId == Index) {
      SecondaryEntryAddr = pMailbox->JumpAddress;
    }

    AcknowledgeInterrupt = ArmGicAcknowledgeInterrupt(
        FixedPcdGet64(PcdGicInterruptInterfaceBase), &InterruptId);
    if (InterruptId <
        ArmGicGetMaxNumInterrupts(FixedPcdGet64(PcdGicDistributorBase))) {
      // Got a valid SGI number hence signal End of Interrupt
      ArmGicEndOfInterrupt(
          FixedPcdGet64(PcdGicInterruptInterfaceBase), AcknowledgeInterrupt);
    }
  } while (SecondaryEntryAddr == 0);

  // Acknowledge this one
  pMailbox->JumpAddress = 0;

  SecondaryStart = (VOID(*)())SecondaryEntryAddr;
  SecondaryStart(pMailbox);

  // Should never reach here
  ASSERT(FALSE);
}