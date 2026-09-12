#!/bin/bash

echo "BUILDING BOOTSHIM !!!!"
echo $(pwd)
cd Nexus5XPkg/BootShim
make UEFI_BASE=0x00200000 UEFI_SIZE=0x00100000
cd $OLDPWD