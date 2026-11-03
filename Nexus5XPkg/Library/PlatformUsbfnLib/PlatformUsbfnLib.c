#include <Base.h>
#include <Library/DebugLib.h>
#include <Library/TimerLib.h>
#include <Library/IoLib.h>
#include <Library/LKEnvLib.h>
#include <Library/PlatformUsbfnLib.h>
//#include <Library/QcomUsbPhyLib.h>
//#include <Library/QcomPlatformUsbLib.h>
#include <Platform/iomap.h>
#include <Library/QcomClockLib.h>
#include <qmp_phy.h>

#ifndef QMP_PHY_BASE
#define QMP_PHY_BASE PcdGet64(PcdUsb30QmpPhyBase)
#endif

#define HS_PHY_COMMON_CTRL 0xEC
#define USE_CORECLK BIT(14)
#define PLLBTUNE BIT(15)
#define FSEL (0x7 << 4)
#define DIS_RETENTION BIT(18)
#define QMP_PHY_MAX_TIMEOUT 1000
#define PHYSTATUS BIT(6)

#if 0
target_usb_iface_t *mUsbInterface = NULL;

VOID
UsbfnPlatformFillInterface()
{
  mUsbInterface->controller             = L"dwc";
  mUsbInterface->mux_config             = target_usb_phy_mux_configure;
  mUsbInterface->phy_init               = usb30_qmp_phy_init;
  mUsbInterface->phy_reset              = qmp_phy_qmp_reset;
  mUsbInterface->clock_init             = clock_usb30_init;
  mUsbInterface->clock_bumpup_pipe3_clk = clock_bumpup_pipe3_clk;
  mUsbInterface->vbus_override          = TRUE;
  mUsbInterface->pll_override           = TRUE;
}
#endif

EFI_STATUS
UsbfnPlatformGetData (OUT USBFN_PLATFORM_DATA *PlatformData)
{
  if (PlatformData == NULL) {
    return EFI_INVALID_PARAMETER;
  }

  // Fill interface struct
  //UsbfnPlatformFillInterface();

  PlatformData->ControllerBase = PcdGet64(PcdUsb30Base);//EXYNOS9830_USBDRD_LINK_BASE;

  PlatformData->MaximumSpeed          = UsbBusSpeedHigh;
  PlatformData->SuperSpeedPhyDisabled = TRUE;

  PlatformData->UtmiWidth = UsbfnUtmiWidth16Bit;

  //PlatformData->Usb2FreeClockExists = FALSE;

  //UsbfnGetFrameLengthAdjust (PlatformData);

  PlatformData->NumEndpoints = 0;

  PlatformData->VendorId  = 0x04E8;
  PlatformData->ProductId = 0x2143;

  return EFI_SUCCESS;
}

EFI_STATUS
UsbfnPlatformPhyReset (VOID)
{

  int      ret = 0;
  uint32_t val;
  bool     phy_com_reset = false;

  struct clk *usb2b_clk    = NULL;
  struct clk *usb_pipe_clk = NULL;
  struct clk *phy_com_clk  = NULL;
  struct clk *phy_clk      = NULL;

  /* Reset usb3 phy */

  /* Look if phy com clock is present */
  phy_com_clk = gClock->clk_get("usb30_phy_com_reset");
  if (phy_com_clk)
    phy_com_reset = true;

  usb2b_clk = gClock->clk_get("usb2b_phy_sleep_clk");
  ASSERT(usb2b_clk);

  phy_clk = gClock->clk_get("usb30_phy_reset");
  ASSERT(phy_clk);

  usb_pipe_clk = gClock->clk_get("usb30_pipe_clk");
  ASSERT(usb_pipe_clk);

  /* ASSERT */
  ret = gClock->clk_reset(usb2b_clk, CLK_RESET_ASSERT);
  if (ret) {
    dprintf(CRITICAL, "Failed to assert usb2b_phy_clk\n");
    return ret;
  }

  if (phy_com_reset) {
    ret = gClock->clk_reset(phy_com_clk, CLK_RESET_ASSERT);
    if (ret) {
      dprintf(CRITICAL, "Failed to assert phy_com_clk\n");
      goto deassert_usb2b_clk;
    }
  }

  ret = gClock->clk_reset(phy_clk, CLK_RESET_ASSERT);
  if (ret) {
    dprintf(CRITICAL, "Failed to assert phy_clk\n");
    goto deassert_phy_com_clk;
  }

  ret = gClock->clk_reset(usb_pipe_clk, CLK_RESET_ASSERT);
  if (ret) {
    dprintf(CRITICAL, "Failed to assert usb_pipe_clk\n");
    goto deassert_phy_clk;
  }

  udelay(100);

  /* DEASSERT */
  ret = gClock->clk_reset(usb_pipe_clk, CLK_RESET_DEASSERT);
  if (ret)
    dprintf(CRITICAL, "Failed to deassert usb_pipe_clk\n");

deassert_phy_clk:
  ret = gClock->clk_reset(phy_clk, CLK_RESET_DEASSERT);
  if (ret)
    dprintf(CRITICAL, "Failed to deassert phy_clk\n");

deassert_phy_com_clk:
  if (phy_com_reset) {
    ret = gClock->clk_reset(phy_com_clk, CLK_RESET_DEASSERT);
    if (ret)
      dprintf(CRITICAL, "Failed to deassert phy_com_clk\n");
  }

deassert_usb2b_clk:
  ret = gClock->clk_reset(usb2b_clk, CLK_RESET_DEASSERT);
  if (ret)
    dprintf(CRITICAL, "Failed to deassert usb2b_phy_clk\n");

  /* Override the phy common control values */
  val = readl(PcdGet64(PcdUsb30ScratchBase) + HS_PHY_COMMON_CTRL);
  val |= USE_CORECLK | PLLBTUNE;
  val &= ~FSEL;
  val &= ~DIS_RETENTION;
  writel(val, PcdGet64(PcdUsb30ScratchBase) + HS_PHY_COMMON_CTRL);

  return EFI_SUCCESS;
}

EFI_STATUS
UsbfnPlatformPhyInit (VOID)
{
  EFI_STATUS Status = EFI_SUCCESS;

  /*if(mUsbInterface == NULL) {
    UsbfnPlatformFillInterface();
  }*/

  DEBUG((EFI_D_ERROR, "UsbfnPlatformPhyInit: Reset phy\n"));
  Status = UsbfnPlatformPhyReset();

  DEBUG((EFI_D_ERROR, "UsbfnPlatformPhyInit: Reset done, yeah what next?\n"));

  //usb30_qmp_phy_init(mUsbInterface);

  return Status;
}

EFI_STATUS
UsbfnPlatformPhyExit (VOID)
{
  return EFI_UNSUPPORTED;
}

BOOLEAN
UsbfnPlatformIsVbusPresent (VOID)
{
  return FALSE;
}
