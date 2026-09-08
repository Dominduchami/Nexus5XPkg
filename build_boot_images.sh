# Create uefi.img
cd ../

# Nexus 5X
cat Nexus5XPkg/BootShim/BootShim.bin Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/MSM8992_EFI.fd > Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd

gzip -c < Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd >Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd.gz

# Rev 1.0 and Rev 1.01
cat Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/BootShimMSM8992_EFI.fd.gz Nexus5XPkg/device-specific/fdt.img Nexus5XPkg/device-specific/msm8992-lg-bullhead-rev-101.dtb >Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/Image.gz-dtb

python ./Nexus5XPkg/mkbootimg.py --kernel Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/Image.gz-dtb --ramdisk Nexus5XPkg/device-specific/ramdisk-null --base 0x00000000 --pagesize 4096 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 -o ./Build/Nexus5X-AARCH64/DEBUG_GCC5/FV/uefi_bullhead.img

# Nexus 6P
cat ./Nexus5XPkg/BootShim/BootShim.bin ./Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/MSM8994_EFI.fd > ./Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/BootShimMSM8994_EFI.fd

gzip -c < ./Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/BootShimMSM8994_EFI.fd >./Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/BootShimMSM8994_EFI.fd.gz

cat ./Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/BootShimMSM8994_EFI.fd.gz ./Nexus5XPkg/device-specific/msm8994-huawei-angler.dtb >Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/Image.gz-dtb

python ./Nexus5XPkg/mkbootimg.py --kernel ./Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/Image.gz-dtb --ramdisk ./Nexus5XPkg/device-specific/ramdisk-null --base 0x00000000 --pagesize 4096 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 -o ./Build/Nexus6P-AARCH64/DEBUG_GCC5/FV/uefi_angler.img
