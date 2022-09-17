#ifndef _LUMIA_950XL_I2C_DEVICES_H_
#define _LUMIA_950XL_I2C_DEVICES_H_

typedef struct _I2C_DEVICE {
  INTN   DeviceId;
  UINT32 QupBase;
  UINT32 QupIrq;
  UINT32 FreqOut;
  UINT32 FreqIn;
  // Device On PIN
  UINT32    DriveStrength;
  GPIO_PULL PullMode;
  BOOLEAN   EnableSetPull;
  UINT32    PinFunction;
  UINT32    SdaPin;
  UINT32    SclPin;
} I2C_DEVICE, *PI2C_DEVICE;

static I2C_DEVICE gI2cDevices[] = {
    // I2C 2 (Touch)
    {2, 0xf9924000, 96, 0x00061A80, 0x0124f800, 2, GPIO_PULL_NONE, TRUE, 3, 6,
     7},
    // Terminator
    {}};

#endif