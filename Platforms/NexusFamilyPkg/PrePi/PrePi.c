// Pi.c: Entry point for SEC(Security).

#include "PrePi.h"
#include "HvcPatch.h"

#include <Pi/PiBootMode.h>
#include <Pi/PiHob.h>
#include <PiDxe.h>
#include <PiPei.h>

#include <Configuration/Hob.h>
#include <Guid/LzmaDecompress.h>
#include <Ppi/GuidedSectionExtraction.h>

#include <Library/ArmLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/CacheMaintenanceLib.h>
#include <Library/DebugAgentLib.h>
#include <Library/DebugLib.h>
#include <Library/FrameBufferSerialPortLib.h>
#include <Library/HobLib.h>
#include <Library/IoLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/PeCoffGetEntryPointLib.h>
#include <Library/PerformanceLib.h>
#include <Library/PrePiHobListPointerLib.h>
#include <Library/PrePiLib.h>
#include <Library/PlatformMemoryMapLib.h>
#include <Library/SerialPortLib.h>
#include <Library/ArmPlatformLib/InitializationUtils.h>

VOID EFIAPI ProcessLibraryConstructorList(VOID);

VOID
MemoryTest(VOID)
{
  // RAM Sanity testing begins here.
  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx = GetPlatformMemoryMap();

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
        AsciiStriCmp("UEFI Mem Pool", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("CPU Vectors", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("HLOS 1", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("HLOS 2", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("HLOS 3", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("HLOS 4", MemoryDescriptorEx->Name) != 0 &&
        AsciiStriCmp("UEFI Stack", MemoryDescriptorEx->Name) != 0) {

      DEBUG((EFI_D_ERROR, "Testing %a. Please wait.\n", MemoryDescriptorEx->Name));

      for (UINT64 i = 0; i < MemoryDescriptorEx->Length; i += sizeof(UINT64)) {
        MmioWrite64(MemoryDescriptorEx->Address + i, 0);
        DEBUG((EFI_D_ERROR, "\rTesting addr: %p", MemoryDescriptorEx->Address + i));
      }

      DEBUG((EFI_D_ERROR, "Testing %a is finished.\n", MemoryDescriptorEx->Name));
    }
    MemoryDescriptorEx++;
  }

  DEBUG((EFI_D_ERROR, "Testing RAM is finished.\n"));
}

VOID Main(IN VOID *StackBase, IN UINTN StackSize, IN UINT64 StartTimeStamp)
{

  EFI_HOB_HANDOFF_INFO_TABLE *HobList;
  EFI_STATUS                  Status;

  UINTN MemoryBase     = 0;
  UINTN MemorySize     = 0;
  UINTN UefiMemoryBase = 0;
  UINTN UefiMemorySize = 0;

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

  MemoryTest();

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
  BuildCpuHob(40, PcdGet8(PcdPrePiCpuIoSize));

  // Set the Boot Mode
  SetBootMode(BOOT_WITH_FULL_CONFIGURATION);

  // Initialize Platform HOBs (CpuHob and FvHob)
  Status = PlatformPeim();
  ASSERT_EFI_ERROR(Status);

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

VOID CEntryPoint(IN VOID *StackBase, IN UINTN StackSize)
{
  EarlyInitialization();

  Main(StackBase, StackSize, 0);
}
