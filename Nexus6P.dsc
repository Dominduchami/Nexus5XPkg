#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#
#  This program and the accompanying materials
#  are licensed and made available under the terms and conditions of the BSD License
#  which accompanies this distribution.  The full text of the license may be found at
#  http://opensource.org/licenses/bsd-license.php
#
#  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
#

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = Nexus6P
  PLATFORM_GUID                  = b6325ac2-9f3f-4b1d-b129-ac7b35ddde60
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/Nexus6P-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Nexus5XPkg/Nexus6P.fdf

  DEFINE SECURE_BOOT_ENABLE           = TRUE
  DEFINE USE_MEMORY_FOR_SERIAL_OUTPUT = 0
  DEFINE USE_SCREEN_FOR_SERIAL_OUTPUT = TRUE
  DEFINE MEMORY_4GB                   = 0

[BuildOptions.common]
!if $(USE_MEMORY_FOR_SERIAL_OUTPUT) == 1
  GCC:*_*_AARCH64_CC_FLAGS = -DSILICON_PLATFORM=8994 -DUSE_MEMORY_FOR_SERIAL_OUTPUT=1
!else
  GCC:*_*_AARCH64_CC_FLAGS = -DSILICON_PLATFORM=8994
!endif

[PcdsFixedAtBuild.common]
  # Platform-specific
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x00000000         # 0GB Base
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000         # 3GB Size
  gArmPlatformTokenSpaceGuid.PcdCoreCount|8
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2
  gNexus5XPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Huawei Nexus 6P"
  gNexus5XPkgTokenSpaceGuid.PcdSmbiosProcessorModel|"Qualcomm Snapdragon 810 Processor (8994)"
  gNexus5XPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|" "

  gNexus5XPkgTokenSpaceGuid.PsciCpuSuspendAddress|0x6c03920

  gNexus5XPkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x03400000
  gNexus5XPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1440
  gNexus5XPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2560
  gNexus5XPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

  gNexus5XPkgTokenSpaceGuid.SynapticsXMax|1440
  gNexus5XPkgTokenSpaceGuid.SynapticsYMax|2560

  # Device Driver Synaptics 3202
  gNexus5XPkgTokenSpaceGuid.SynapticsCtlrAddress|0x70
  gNexus5XPkgTokenSpaceGuid.SynapticsCtlrResetPin|96
  gNexus5XPkgTokenSpaceGuid.SynapticsCtlrIntPin|77
  gNexus5XPkgTokenSpaceGuid.SynapticsCtlrI2cDevice|2

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1440
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|2560
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1440
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|2560
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|120
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|160
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|120
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|160
  
!include Nexus5XPkg/Shared.dsc.inc
