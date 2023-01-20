#ifndef _PLATFORM_UTILS_H_
#define _PLATFORM_UTILS_H_

#define ANGLER_PIPE_BASE  0xFD905000
#define ANGLER_PIPE2_BASE 0xFD907000
#define BULLHEAD_PIPE_BASE  0xFD915000

#define MDP_PP_SYNC_CONFIG_VSYNC	0x004
#define MDP_PP_AUTOREFRESH_CONFIG	0x030

EFI_STATUS
EFIAPI
QGicPeim(VOID);

VOID QGicCpuInit(VOID);
VOID QgicCpuInitSecondary(VOID);

UINTN EFIAPI ArmGicAcknowledgeInterrupt(
    IN UINTN GicInterruptInterfaceBase, OUT UINTN *InterruptId);
VOID EFIAPI ArmGicEnableInterruptInterface(IN INTN GicInterruptInterfaceBase);

VOID EFIAPI
ArmGicV2EndOfInterrupt(IN UINTN GicInterruptInterfaceBase, IN UINTN Source);

VOID EFIAPI
ArmGicEndOfInterrupt(IN UINTN GicInterruptInterfaceBase, IN UINTN Source);

UINTN EFIAPI ArmGicGetMaxNumInterrupts(IN INTN GicDistributorBase);

#endif /* _PLATFORM_UTILS_H_ */