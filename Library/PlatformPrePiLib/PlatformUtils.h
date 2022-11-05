#ifndef _PLATFORM_UTILS_H_
#define _PLATFORM_UTILS_H_

#include <Library/PcdLib.h>
#include <Library/PrintLib.h>
#include <Library/BaseLib.h>

#define PIPE_BASE  0xFD915000

VOID PlatformInitialize();

#endif /* _PLATFORM_UTILS_H_ */