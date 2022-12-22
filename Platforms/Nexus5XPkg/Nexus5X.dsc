## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = Nexus5X
  PLATFORM_GUID                  = b6325ac2-9f3f-4b1d-b129-ac7b35ddde60
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/Nexus5X-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Nexus5XPkg/Nexus5X.fdf
  SECURE_BOOT_ENABLE             = TRUE
  USE_PHYSICAL_TIMER             = TRUE
  USE_SCREEN_FOR_SERIAL_OUTPUT   = 0
  USE_MEMORY_FOR_SERIAL_OUTPUT   = 0
  SEND_HEARTBEAT_TO_SERIAL       = 0

[BuildOptions.common]
  GCC:*_*_AARCH64_CC_FLAGS = -DSILICON_PLATFORM=8992

[PcdsFixedAtBuild.common]
  # Platform-specific
  gArmTokenSpaceGuid.PcdSystemMemorySize|0xC0000000        # 3GB Size

  # SMBIOS
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Nexus 5X"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"RM-1104"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"RM-1104"
  gNexusFamilyPkgTokenSpaceGuid.PcdSmbiosBoardModel|"Nexus 5X"

  # Simple FrameBuffer
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1920
  gNexusFamilyPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

  gQcomPkgTokenSpaceGuid.SynapticsXMax|1440
  gQcomPkgTokenSpaceGuid.SynapticsYMax|2660

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|1920
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|1920
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|160
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|120

!include QcomPkg/QcomPkg.dsc.inc
!include NexusFamilyPkg/NexusFamily.dsc.inc
!include NexusFamilyPkg/Frontpage.dsc.inc