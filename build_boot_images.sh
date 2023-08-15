#!/bin/bash

cat ./Build/Nexus5X-AARCH64/DEBUG_CLANG38/FV/MSM8992_EFI.fd > ./ImageResources/Bullhead/bootpayload.bin

gzip -c < ./ImageResources/Bullhead/bootpayload.bin >./ImageResources/Bullhead/bootpayload.bin.gz

dtc -I dts -O dtb ./ImageResources/Bullhead/bullhead.dts -o ./ImageResources/Bullhead/bullhead.dtb

cat ./ImageResources/Bullhead/bootpayload.bin.gz ./ImageResources/Bullhead/bullhead.dtb >> ./ImageResources/Bullhead/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Bullhead/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00000000 --pagesize 4096 \
  --ramdisk_offset 0x02000000 \
  --tags_offset 0x01e00000 \
  -o ./ImageResources/Bullhead/uefi.img


cat ./Build/Nexus6P-AARCH64/DEBUG_CLANG38/FV/MSM8994_EFI.fd > ./ImageResources/Angler/bootpayload.bin

gzip -c < ./ImageResources/Angler/bootpayload.bin >./ImageResources/Angler/bootpayload.bin.gz

dtc -I dts -O dtb ./ImageResources/Angler/angler.dts -o ./ImageResources/Angler/angler.dtb

cat ./ImageResources/Angler/bootpayload.bin.gz ./ImageResources/Angler/angler.dtb >> ./ImageResources/Angler/Image.gz-dtb

mkbootimg --kernel ./ImageResources/Angler/Image.gz-dtb \
  --ramdisk ./ImageResources/ramdisk-null \
  --base 0x00000000 --pagesize 4096 \
  --ramdisk_offset 0x02000000 \
  --tags_offset 0x01e00000 \
  -o ./ImageResources/Angler/uefi.img