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

/* 
 * Reconfigure the framebuffer to a BGRA 32bpp one (windows requirements)
 *
 * Uses code from https://imbushuo.net/blog/archives/590/ (Little-kernel section)
 * 
 * TODO: Dynamically detect pipes
 */
VOID CheckMdpConfig(VOID)
{
  UINT32 Width = FixedPcdGet32(PcdMipiFrameBufferWidth);

#if SILICON_PLATFORM == 8992
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000236FF);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, Width * 4);
  MmioWrite32(MDP_CTL_0_BASE + CTL_FLUSH, (1 << (3)));
#else
  /* Angler uses dual-pipe framebuffer */
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000237FF);
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(ANGLER_PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, Width * 4);
  MmioWrite32(MDP_CTL_0_BASE + CTL_FLUSH, (1 << (0)));

  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_FORMAT, 0x000237FF);
  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(ANGLER_PIPE2_BASE + PIPE_SSPP_SRC_YSTRIDE, Width * 4);
  MmioWrite32(MDP_CTL_1_BASE + CTL_FLUSH, (1 << (1)));
#endif
}

/* 
 * Turn on autorefresh on command-mode panels 
 * (stock bootloader disables it here).
 *
 * Based on lk2nd code :
 * https://github.com/msm8916-mainline/lk2nd/pull/137/commits/d0492fdd1f5e6ff51a181fd6d4920c62adc1a23e#diff-c75b4efb45794d329b2414b12f0a97190c5fe0d9dd43f33e84969e1c34f5ca99R158
 */
STATIC
VOID
DisplayEnableRefresh(VOID)
{
  UINT32 Height = FixedPcdGet32(PcdMipiFrameBufferHeight);
  UINT32 VsyncCount = 19200000 / (Height * 60);
  UINT32 MdssMdpRev = MmioRead32(MDP_HW_REV);
  UINT32 pp0_base;

  if (MdssMdpRev >= MDSS_MDP_HW_REV_105)
    pp0_base = REG_MDP(0x71000);
  else if (MdssMdpRev >= MDSS_MDP_HW_REV_102)
    pp0_base = REG_MDP(0x12D00);
  else
    pp0_base = REG_MDP(0x21B00);

  MmioWrite32(pp0_base + MDP_PP_SYNC_CONFIG_VSYNC, VsyncCount | BIT(19));

  /* Enable autorefresh and flush */
  MmioWrite32(pp0_base + MDP_PP_AUTOREFRESH_CONFIG, BIT(31) | AUTOREFRESH_FRAMENUM);
  MmioWrite32(MDP_CTL_0_BASE + CTL_START, 1);
}

VOID PlatformInitialize(VOID)
{
  DisplayEnableRefresh();
  CheckMdpConfig();
}