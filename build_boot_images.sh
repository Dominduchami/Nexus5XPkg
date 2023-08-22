#!/bin/bash

cat ./BootShim/BootShim.bin ./Build/Nexus5X-AARCH64/DEBUG_CLANG38/FV/MSM8992_EFI.fd > ./ImageResources/Bullhead/bootpayload.bin

gzip -c < ./ImageResources/Bullhead/bootpayload.bin >./ImageResources/Bullhead/bootpayload.bin.gz

dtc -I dts -O dtb ./ImageResources/Bullhead/bullhead.dts -o ./ImageResources/Bullhead/bullhead.dtb

cat ./ImageResources/Bullhead/bootpayload.bin.gz ./ImageResources/Bullhead/bullhead.dtb >> ./ImageResources/Bullhead/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Bullhead/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00000000 --pagesize 4096 \
  --ramdisk_offset 0x02000000 \
  --tags_offset 0x01e00000 \
  -o ./ImageResources/Bullhead/uefi.img


cat ./BootShim/BootShim.bin ./Build/Nexus6P-AARCH64/DEBUG_CLANG38/FV/MSM8994_EFI.fd > ./ImageResources/Angler/bootpayload.bin

gzip -c < ./ImageResources/Angler/bootpayload.bin >./ImageResources/Angler/bootpayload.bin.gz

dtc -I dts -O dtb ./ImageResources/Angler/angler.dts -o ./ImageResources/Angler/angler.dtb

cat ./ImageResources/Angler/bootpayload.bin.gz ./ImageResources/Angler/angler.dtb >> ./ImageResources/Angler/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Angler/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00000000 --pagesize 4096 \
  --ramdisk_offset 0x02000000 \
  --tags_offset 0x01e00000 \
  -o ./ImageResources/Angler/uefi.img

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