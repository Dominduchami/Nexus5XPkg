#!/usr/bin/bash
set -e

device="${1}"
build_type="${2:-DEBUG}"
devicelower="$(tr '[:upper:]' '[:lower:]' <<< "${device}")"

case "${device}" in
Nexus6P)
ARCH_DIR="Nexus6P-AARCH64"
EFI_FD_NAME="MSM8994_EFI.fd"
DTB="ImageResources/Angler/msm8994-huawei-angler.dtb"
OUT_IMG="ImageResources/Angler/uefi_angler.img"
    ;;
Nexus5X)
ARCH_DIR="Nexus5X-AARCH64"
EFI_FD_NAME="MSM8992_EFI.fd"
DTB="ImageResources/Bullhead/msm8992_lge_bullhead.dtb"
OUT_IMG="ImageResources/Bullhead/uefi_bullhead.img"
    ;;
*)
echo "Bootimages: Invalid platform: ${device}" 1>&2
exit 1
    ;;
esac

FV_DIR="workspace/Build/${ARCH_DIR}/${build_type}_GCC5/FV"
EFI_FD="${FV_DIR}/${EFI_FD_NAME}"

if [ ! -f "${EFI_FD}" ]; then
echo "Unable to find build artifacts (${EFI_FD})." 1>&2
exit 1
fi

cat "BootShim/BootShim.bin" "${EFI_FD}" > "${FV_DIR}/BootShim${EFI_FD_NAME}"
gzip -c < "${FV_DIR}/BootShim${EFI_FD_NAME}" > "${FV_DIR}/BootShim${EFI_FD_NAME}.gz"
cat "${FV_DIR}/BootShim${EFI_FD_NAME}.gz" "${DTB}" > "${FV_DIR}/Image.gz-dtb"

ramdisk="$(mktemp)"
printf "\0" > "${ramdisk}"

python3 "ImageResources/mkbootimg.py" \
--kernel "${FV_DIR}/Image.gz-dtb" \
--ramdisk "${ramdisk}" \
--base 0x00000000 \
--pagesize 4096 \
--ramdisk_offset 0x02000000 \
--tags_offset 0x01e00000 \
-o "${OUT_IMG}"
ret=$?

rm -f "${ramdisk}"

if [ ${ret} -ne 0 ]; then
echo "Failed to build ${OUT_IMG}" 1>&2
exit 1
fi

echo "Built ${OUT_IMG}"