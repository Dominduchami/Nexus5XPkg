#!/bin/bash
# Travis CI builder
#
# Copyright 2018, Bingxing Wang. <uefi-oss-projects@imbushuo.net>
# All rights reserved.
#

# Export AArch64 Tools prefix on CI
export GCC5_AARCH64_PREFIX=/opt/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-elf/bin/aarch64-elf-
# Export BUILD flags 
export BUILD_BULLHEAD=1 ##??

# Go to EDK2 workspace
cd ..
cd edk2

# Start build
echo "Start build..."
. Nexus5XPkg/Tools/rundbbuild.sh --bullhead --development

# Check if we have both FD ready
if [ ! -f Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/MSM8992_EFI.fd ]; then
    echo "Unable to find build artifacts."
    exit 1
fi

cat ./Nexus5XPkg/BootShim/BootShim.bin ./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/MSM8992_EFI.fd > ./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd

gzip -c < ./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd >./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd.gz

# Rev 1.0 and Rev 1.01
cat ./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd.gz ./Nexus5XPkg/device-specific/fdt.img >Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/Image.gz-dtb

mkbootimg --kernel ./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/Image.gz-dtb --ramdisk ./Nexus5XPkg/device-specific/ramdisk-null --base 0x00000000 --pagesize 4096 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 -o ./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/uefi_bullhead.img
