#include <Library/DebugLib.h>
#include <Library/PlatformUsbfnLib.h>
#include <Library/QcomUsbPhyLib.h>

/* global reference counter between all HSPHY instances */
static INT32 hsphy_active_count;

EFI_STATUS
UsbfnPlatformGetData (OUT USBFN_PLATFORM_DATA *PlatformData)
{
  if (PlatformData == NULL) {
    return EFI_INVALID_PARAMETER;
  }

  PlatformData->ControllerBase = NULL;//EXYNOS9830_USBDRD_LINK_BASE;

  PlatformData->MaximumSpeed          = UsbBusSpeedHigh;
  PlatformData->SuperSpeedPhyDisabled = TRUE;

  PlatformData->UtmiWidth = UsbfnUtmiWidth16Bit;

  //PlatformData->Usb2FreeClockExists = FALSE;

  UsbfnGetFrameLengthAdjust (PlatformData);

  PlatformData->NumEndpoints = 0;

  PlatformData->VendorId  = 0x04E8;
  PlatformData->ProductId = 0x2143;

  return EFI_SUCCESS;
}

EFI_STATUS
UsbfnPlatformPhyReset (VOID)
{
  /*if (hsphy_active_count > 1) {
    // skip reset if there are other active PHY instances
    DEBUG((EFI_D_ERROR, "Skipping phy reset\n"));
    return EFI_SUCCESS;
  }*/
  qusb2_phy_reset();

  qmp_phy_qmp_reset()


  return EFI_UNSUPPORTED;
}

EFI_STATUS
UsbfnPlatformPhyInit (VOID)
{
  EFI_STATUS Status = EFI_SUCCESS;

  Status = UsbfnPlatformPhyReset();
  return EFI_UNSUPPORTED;
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
