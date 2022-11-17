#!/bin/bash
# Generic CI environment bootstrapper
# Stage 1
#
# Copyright 2018-2019, Bingxing Wang. <uefi-oss-projects@imbushuo.net>
# All rights reserved.
#

# Checkout EDK2 at master and recent commit only
echo "Checking out EDK2 workspace"

cd ..
git clone --single-branch --depth 1 --recurse-submodules --branch master https://github.com/tianocore/edk2

# Set a link to EDK2 workspace
ln -s $(pwd)/Nexus5XPkg $(pwd)/edk2/Nexus5XPkg
# ln -s $(pwd)/Nexus5XPkg/Tools/rundbbuild.sh $(pwd)/edk2/rundbbuild.sh
chmod +x $(pwd)/Nexus5XPkg/Tools/rundbbuild.sh

# Build EDK2 Tools
cd edk2
make -C BaseTools
