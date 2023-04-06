#include <PiPei.h>
#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/IoLib.h>
#include <Library/PcdLib.h>
#include <Library/PlatformPrePiLib.h>
#include <Library/LKEnvLib.h>
#include "PlatformUtils.h"

#include <Chipset/mdp5.h>
#include <Platform/iomap.h>

BOOLEAN IsLinuxBootRequested(VOID)
{
  /* TODO : 
  * make it dependent on key press 
  * actually use it */
  return FALSE;
}

VOID CheckMdpConfig(VOID)
{
  /* Windows requires a BGRA FB */
#if SILICON_PLATFORM == 8992
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000236FF);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, 1080*4);
  MmioWrite32(MDP_CTL_0_BASE + CTL_FLUSH, (1 << (3)));
#else
  /* Angler uses dual pipe framebuffer */
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000237FF);
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, 1080*4);
  MmioWrite32(MDP_CTL_0_BASE + CTL_FLUSH, (1 << (0)));

  /*MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_FORMAT, 0x000237FF);
  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_YSTRIDE, 1440*4);
  MmioWrite32(MDP_CTL_1_BASE + CTL_FLUSH, (1 << (1)));*/
#endif
}

VOID PlatformInitialize(VOID)
{
  CheckMdpConfig();
}