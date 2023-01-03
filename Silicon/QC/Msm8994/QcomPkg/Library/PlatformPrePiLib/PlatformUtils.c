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
	uint32_t tmp_stride = readl(PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE);

  	/* Windows requires a BGRA FB */
  	writel(0x000236FF, PIPE_BASE + PIPE_SSPP_SRC_FORMAT);
  	writel(0x03020001, PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN);
  	writel(tmp_stride/4, PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE);
  	writel(BIT(3), MDP_CTL_0_BASE + CTL_FLUSH);
}

STATIC
VOID
DisplayEnableRefresh(VOID)
{
	uint32_t height = FixedPcdGet32(PcdMipiFrameBufferHeight);
	uint32_t vsync_count = 19200000 / (height * 60); /* 60 fps */
	uint32_t mdss_mdp_rev = readl(MDP_HW_REV);
	uint32_t pp0_base;

	if (mdss_mdp_rev >= MDSS_MDP_HW_REV_105)
		pp0_base = REG_MDP(0x71000);
	else if (mdss_mdp_rev >= MDSS_MDP_HW_REV_102)
		pp0_base = REG_MDP(0x12D00);
	else
		pp0_base = REG_MDP(0x21B00);

	MmioWrite32(pp0_base + MDP_PP_SYNC_CONFIG_VSYNC, vsync_count | BIT(19));
	MmioWrite32(pp0_base + MDP_PP_AUTOREFRESH_CONFIG, BIT(31) | 1);
	MmioWrite32(MDP_CTL_0_BASE + CTL_START, 1);
}

VOID PlatformInitialize(VOID)
{
  DisplayEnableRefresh();

  CheckMdpConfig();
}