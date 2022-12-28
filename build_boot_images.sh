#!/bin/bash

cat ./BootShim/BootShim.bin ./Build/Nexus5X-AARCH64/DEBUG_CLANG38/FV/MSM8992_EFI.fd > ./ImageResources/bootpayload.bin

gzip -c < ./ImageResources/bootpayload.bin >./ImageResources/bootpayload.bin.gz

cat ./ImageResources/bootpayload.bin.gz ./ImageResources/fdt.img >> ./ImageResources/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00000000 --pagesize 4096 \
  --ramdisk_offset 0x02000000 \
  --tags_offset 0x01e00000 \
  -o ./ImageResources/uefi.img