#!/bin/bash
# Travis CI builder
#
# Copyright 2018, Bingxing Wang. <uefi-oss-projects@imbushuo.net>
# All rights reserved.
#

# Go to EDK2 workspace
cd ..
cd edk2

# Start build
echo "Start build..."
./Nexus5XPkg/Tools/CI/Builder/BuildAngler.sh
./Nexus5XPkg/Tools/CI/Builder/BuildBullhead.sh

# Check if we have both FD ready
if [ ! -f Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/MSM8992_EFI.fd ]; then
    echo "Unable to find build artifacts."
    exit 1
fi
if [ ! -f Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/MSM8994_EFI.fd ]; then
    echo "Unable to find build artifacts."
    exit 1
fi