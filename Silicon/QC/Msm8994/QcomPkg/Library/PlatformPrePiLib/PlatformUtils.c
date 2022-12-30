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
/*
STATIC
VOID
DisplayEnableRefresh(VOID)
{
  MmioWrite32(MDP_REG_PP_0_AUTOREFRESH_CONFIG, ((1 << (31)) | AUTOREFRESH_FRAMENUM));
  ArmDataSynchronizationBarrier();
};*/

#define MDP_PP_SYNC_CONFIG_VSYNC	0x004
#define MDP_PP_AUTOREFRESH_CONFIG	0x030

STATIC
VOID
DisplayEnableRefresh(VOID)
{
#if SILICON_PLATFORM == 8992
  uint32_t height = 1080;
#else
  uint32_t height = 1440;
#endif
  uint32_t vsync_count = 19200000 / (height * 60); /* 60 fps */
	uint32_t mdss_mdp_rev = readl(MDP_HW_REV);
	uint32_t pp0_base;

	if (mdss_mdp_rev >= MDSS_MDP_HW_REV_105)
		pp0_base = REG_MDP(0x71000);
	else if (mdss_mdp_rev >= MDSS_MDP_HW_REV_102)
		pp0_base = REG_MDP(0x12D00);
	else
		pp0_base = REG_MDP(0x21B00);

	writel(vsync_count | BIT(19), pp0_base + MDP_PP_SYNC_CONFIG_VSYNC);
	writel(BIT(31) | 1, pp0_base + MDP_PP_AUTOREFRESH_CONFIG);
	writel(1, MDP_CTL_0_BASE + CTL_START);
}

VOID PlatformInitialize(VOID)
{
  CheckMdpConfig();

  DisplayEnableRefresh();
}