#!/bin/bash

# HTC One M9
cat ./BootShim/BootShim.bin ./Build/HtcOneM9-AARCH64/DEBUG_CLANG38/FV/MSM8994_EFI.fd > ./ImageResources/Hima/bootpayload.bin

#dtc -I dts -O dtb ./ImageResources/Hima/Hima.dts -o ./ImageResources/Hima/Hima.dtb

gzip -c < ./ImageResources/Hima/bootpayload.bin >./ImageResources/Hima/bootpayload.bin.gz

cat ./ImageResources/Hima/bootpayload.bin.gz ./ImageResources/Hima/Hima.dtb >> ./ImageResources/Hima/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Hima/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00078000 --pagesize 4096 \
  --ramdisk_offset 0x01f88000 \
  --tags_offset 0x01d88000 \
  -o ./ImageResources/Hima/uefi.img