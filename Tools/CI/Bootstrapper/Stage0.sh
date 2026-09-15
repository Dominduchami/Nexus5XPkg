#!/bin/bash
# Travis CI environment bootstrapper (run this as root user)
# Stage 0
#
# Copyright 2018, Bingxing Wang. <uefi-oss-projects@imbushuo.net>
# All rights reserved.
#

# Permission check
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

echo "Installing build components..."

# Host utilities
apt-get install git-core git
apt-get install build-essential
apt-get install python3

# Linaro Toolchains
cd /opt
git clone --depth=1 https://github.com/thirdreality/buildroot-toolchain toolchain
mv toolchain/* ./
rm -rf toolchain
# Skip ACPI toolchain (prebuilt tables)

echo "Build components are ready. If you would like to build ACPI tables, please install recent acpica tools."
