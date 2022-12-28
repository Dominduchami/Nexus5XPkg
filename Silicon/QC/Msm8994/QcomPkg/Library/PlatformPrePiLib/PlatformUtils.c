#include <PiPei.h>
#include <Library/ArmLib.h>
#include <Library/BaseLib.h>
#include <Library/BaseMemoryLib.h>
#include <Library/IoLib.h>
#include <Library/PlatformPrePiLib.h>
#include "PlatformUtils.h"

#include <Chipset/mdp5.h>
#include <Platform/iomap.h>

BOOLEAN IsLinuxBootRequested(VOID)
{
  return FALSE;
}

VOID CheckMdpConfig(VOID)
{
  /* Windows requires a BGRA FB */
  MmioWrite32(PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000236FF);
  MmioWrite32(PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);

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
  CheckMdpConfig();

  DisplayEnableRefresh();
}