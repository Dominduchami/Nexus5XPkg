#ifndef _PLATFORM_UTILS_H_
#define _PLATFORM_UTILS_H_

#include <Library/PcdLib.h>

#define BIT(bit) (1 << (bit))

#define ANGLER_PIPE_BASE  0xFD905000
#define ANGLER_PIPE2_BASE 0xFD907000
#define BULLHEAD_PIPE_BASE  0xFD915000

#define MDP_PP_SYNC_CONFIG_VSYNC	0x004
#define MDP_PP_AUTOREFRESH_CONFIG	0x030
#define AUTOREFRESH_FRAMENUM 1

VOID PlatformInitialize();

#endif /* _PLATFORM_UTILS_H_ */