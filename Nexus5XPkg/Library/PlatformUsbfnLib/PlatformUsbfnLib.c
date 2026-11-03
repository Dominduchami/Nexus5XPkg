#include <Library/DebugLib.h>
#include <Library/TimerLib.h>
#include <Library/LKEnvLib.h>
#include <Library/PlatformUsbfnLib.h>
#include <Library/QcomUsbPhyLib.h>
#include <Library/QcomPlatformUsbLib.h>

target_usb_iface_t *mUsbInterface = NULL;

EFI_STATUS
UsbfnPlatformGetData (OUT USBFN_PLATFORM_DATA *PlatformData)
{
  if (PlatformData == NULL) {
    return EFI_INVALID_PARAMETER;
  }

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

  // Reset usb2 phy
  qusb2_phy_reset();

  // Reset usb3 phy
  qmp_phy_qmp_reset(mUsbInterface);

  return EFI_SUCCESS;
}

EFI_STATUS
UsbfnPlatformPhyInit (VOID)
{
  EFI_STATUS Status = EFI_SUCCESS;

  if(mUsbInterface == NULL) {
    LibQcomPlatformUsbGetInterface(mUsbInterface);
  }

  Status = UsbfnPlatformPhyReset();

  DEBUG((EFI_D_ERROR, "UsbfnPlatformPhyInit: Reset done, yeah what next?\n"));

  usb30_qmp_phy_init(mUsbInterface);

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
