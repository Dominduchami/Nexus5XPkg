#include <Library/PcdLib.h>
#include <AsmMacroIoLibV8.h>
#include <Chipset/AArch64.h>

.text
.align 3

GCC_ASM_IMPORT (ArmDeInitialize)
GCC_ASM_IMPORT (CEntryPoint)
GCC_ASM_EXPORT (_ModuleEntryPoint)
GCC_ASM_IMPORT (ArmEnableInstructionCache)
GCC_ASM_IMPORT (ArmEnableDataCache)
GCC_ASM_IMPORT (ArmInvalidateTlb)

.global _StackBase 
.global _StackSize
.global CNTFRQ 

_StackBase:
  .quad FixedPcdGet32(PcdPrePiStackBase)

_StackSize:
  .quad FixedPcdGet32(PcdPrePiStackSize)

CNTFRQ:
  .quad 0x0124F800

_ModuleEntryPoint:
  // backup start address into x20
  mov    x20, x1
  // backup device tree address into x21
  mov    x21, x0

  /* World reset */
  bl ASM_PFX(ArmDeInitialize)

  /* Clear x0 for function calls below */
  mov x0, #0
  mov x1, #0

  /* First ensure all interrupts are disabled */
  bl ASM_PFX(ArmDisableInterrupts)

  /* Ensure that the MMU and caches are off */
  bl ASM_PFX(ArmDisableCachesAndMmu)
 
  /* Invalide I-Cache */
  bl ASM_PFX(ArmInvalidateInstructionCache)
  
  /* Invalidate TLB */
  bl ASM_PFX(ArmInvalidateTlb)

  /* Get current EL in x0 */
  EL1_OR_EL2_OR_EL3(x0)

1:  b _SetupPrimaryCoreStack
2:  b _SetupPrimaryCoreStack

  /* We should have EL1 initialized */
3:  b dead

_SetupPrimaryCoreStack:
  ldr x0, _StackBase     /* Stack base arg0 */
  ldr x1, _StackSize     /* Stack size arg1 */
  
  add x4, x0, x1
  add sp, x4, #0
  
_EnableCache: 
  bl ArmInvalidateDataCache
  bl ASM_PFX(ArmEnableInstructionCache)
  bl ASM_PFX(ArmEnableDataCache)

_PrepareArguments:
  /* x0 = _StackBase and x1 = _StackSize */
  ldr x0, _StackBase     /* Stack base arg0 */
  ldr x1, _StackSize     /* Stack size arg1 */

  bl CEntryPoint

.align 3
dead:  
  b dead                      /* We should never get here */

