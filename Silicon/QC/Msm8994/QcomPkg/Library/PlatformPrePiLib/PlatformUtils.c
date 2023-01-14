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
#if SILICON_PLATFORM == 8992
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_FORMAT, 0x000236FF);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_UNPACK_PATTERN, 0x03020001);
  MmioWrite32(BULLHEAD_PIPE_BASE + PIPE_SSPP_SRC_YSTRIDE, 1080*4);
#else
  writel(0x0002243F, 0xfd905030);
  writel(0x03020001, 0xfd905034);
  //writel(1440*3, 0xfd905024);
#endif
  writel(BIT(3), 0xfd902018);
}

STATIC
VOID
DisplayEnableRefresh(VOID)
{
#if SILICON_PLATFORM == 8994
  uint32_t height = FixedPcdGet32(PcdMipiFrameBufferHeight);
  uint32_t vsync_count = 19200000 / (height * 60);//760000000 or 905000000 
#endif
  uint32_t mdss_mdp_rev = readl(MDP_HW_REV);
  uint32_t pp0_base;

  if (mdss_mdp_rev >= MDSS_MDP_HW_REV_105)
    pp0_base = REG_MDP(0x71000);
  else if (mdss_mdp_rev >= MDSS_MDP_HW_REV_102)
    pp0_base = REG_MDP(0x12D00);
  else
    pp0_base = REG_MDP(0x21B00);

#if SILICON_PLATFORM == 8994
  MmioWrite32(pp0_base + MDP_PP_SYNC_CONFIG_VSYNC, vsync_count | BIT(19));
#endif
  MmioWrite32(pp0_base + MDP_PP_AUTOREFRESH_CONFIG, BIT(31) | 1);
  MmioWrite32(MDP_CTL_0_BASE + CTL_START, 1);
}

STATIC
VOID
CleanScreen(VOID)
{
  char *Pixels = (void *)0x03400000ull;
  UINTN BgColor = 0xff000000;

  // Set to black color
  for (UINTN i = 0; i < 1080; i++) {
    for (UINTN j = 0; j < 2560; j++) {
      BgColor = 0xff000000;
      // Set pixel bit 
      for (UINTN p = 0; p < (32 / 8); p++) {
        *Pixels = (unsigned char)BgColor;
        BgColor = BgColor >> 8;
        Pixels++;
      }
    }
  }
}

VOID PlatformInitialize(VOID)
{
  CheckMdpConfig();

  DisplayEnableRefresh();

  CleanScreen();
}