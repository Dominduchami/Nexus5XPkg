/** @file

  Copyright (c) 2011-2015, ARM Limited. All rights reserved.

  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#include <PiPei.h>

#include <Library/ArmMmuLib.h>
#include <Library/ArmPlatformLib.h>
#include <Library/DebugLib.h>
#include <Library/HobLib.h>
#include <Library/MemoryAllocationLib.h>
#include <Library/PcdLib.h>
#include <Library/PlatformMemoryMapLib.h>

VOID
BuildMemoryTypeInformationHob (
  VOID
  );

STATIC
VOID
InitMmu (
  IN ARM_MEMORY_REGION_DESCRIPTOR  *MemoryTable
  )
{
  VOID           *TranslationTableBase;
  UINTN          TranslationTableSize;
  RETURN_STATUS  Status;

  // Note: Because we called PeiServicesInstallPeiMemory() before to call InitMmu() the MMU Page Table resides in
  //      DRAM (even at the top of DRAM as it is the first permanent memory allocation)
  Status = ArmConfigureMmu (MemoryTable, &TranslationTableBase, &TranslationTableSize);
  if (EFI_ERROR (Status)) {
    DEBUG ((DEBUG_ERROR, "Error: Failed to enable MMU\n"));
  }
}

STATIC
VOID AddHob(PARM_MEMORY_REGION_DESCRIPTOR_EX Desc)
{
  if (Desc->HobOption != AllocOnly) {
    BuildResourceDescriptorHob(
        Desc->ResourceType, Desc->ResourceAttribute, Desc->Address, Desc->Length);
  }

  if (Desc->ResourceType == EFI_RESOURCE_SYSTEM_MEMORY ||
      Desc->MemoryType == EfiRuntimeServicesData)
  {
    BuildMemoryAllocationHob(Desc->Address, Desc->Length, Desc->MemoryType);
  }
}

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

/*++

Routine Description:



Arguments:

  FileHandle  - Handle of the file being invoked.
  PeiServices - Describes the list of possible PEI Services.

Returns:6A00000

  Status -  EFI_SUCCESS if the boot mode could be set

--*/
EFI_STATUS
EFIAPI
MemoryPeim (
  IN EFI_PHYSICAL_ADDRESS  UefiMemoryBase,
  IN UINT64                UefiMemorySize
  )
{

  PARM_MEMORY_REGION_DESCRIPTOR_EX MemoryDescriptorEx =
      GetPlatformMemoryMap();
  ARM_MEMORY_REGION_DESCRIPTOR
        MemoryTable[MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT];
  UINTN Index = 0;

  // Ensure PcdSystemMemorySize has been set
  ASSERT (PcdGet64 (PcdSystemMemorySize) != 0);

  // Run through each memory descriptor
  while (MemoryDescriptorEx->Length != 0) {
    switch (MemoryDescriptorEx->HobOption) {
    case AddMem:
    case AddDev:
    case HobOnlyNoCacheSetting:
    case AllocOnly:
      AddHob(MemoryDescriptorEx);
      break;
    case NoHob:
    default:
      goto update;
    }

    if (MemoryDescriptorEx->HobOption == HobOnlyNoCacheSetting) {
      MemoryDescriptorEx++;
      continue;
    }

  update:
    ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);

    MemoryTable[Index].PhysicalBase = MemoryDescriptorEx->Address;
    MemoryTable[Index].VirtualBase  = MemoryDescriptorEx->Address;
    MemoryTable[Index].Length       = MemoryDescriptorEx->Length;
    MemoryTable[Index].Attributes   = MemoryDescriptorEx->ArmAttributes;

    Index++;
    MemoryDescriptorEx++;
  }

  // Last one (terminator)
  ASSERT(Index < MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT);
  MemoryTable[Index].PhysicalBase = 0;
  MemoryTable[Index].VirtualBase  = 0;
  MemoryTable[Index].Length       = 0;
  MemoryTable[Index].Attributes   = 0;

  // Build Memory Allocation Hob
  InitMmu (MemoryTable);

  if (FeaturePcdGet (PcdPrePiProduceMemoryTypeInformationHob)) {
    // Optional feature that helps prevent EFI memory map fragmentation.
    BuildMemoryTypeInformationHob ();
  }

  MemoryTest();

  return EFI_SUCCESS;
}