#!/bin/bash
# based on the instructions from edk2-platform
set -e
export PACKAGES_PATH=$PWD/../edk2:$PWD
export WORKSPACE=$PWD/workspace

AvailablePlatforms=("Nexus5X" "Nexus6P" "All")
IsValid=0
BUILD_TYPE="DEBUG"
device=""

while [[ $# -gt 0 ]]; do
    case "$1" in
    -d)
        device="${2}"
        shift 2
        ;;
    --release)
        BUILD_TYPE="RELEASE"
        shift
        ;;
    *)
        shift
        ;;
    esac
done

function _check_args() {
local DEVICE="${1}"
for Name in "${AvailablePlatforms[@]}"
do
if [ "${DEVICE}" == "${Name}" ]
then
IsValid=1
break;
fi
done
}

function _clean() {
for PlatformName in "${AvailablePlatforms[@]}"
do
if [ "${PlatformName}" != "All" ]; then
rm -f "ImageResources/${PlatformName}/uefi*.img"
fi
done
rm -f "BootShim/BootShim."{bin,elf}
rm -rf "workspace/Build"
echo "Artifacts removed"
}

# Check current commit ID and write it into file for SMBIOS reference. (Trim it)
# Check current date and write it into file for SMBIOS reference too. (MM/dd/yyyy)
function _stamp_build() {
echo "Stamp build."
# This one is EDK2 base commit
local EDK2_COMMIT
EDK2_COMMIT="$(git -C ../edk2 rev-parse HEAD)"
# This is Nexus5XPkg package commit
local COMMIT
COMMIT="$(git rev-parse HEAD)"
local DATE
DATE="$(date +%m/%d/%Y)"
local USER_NAME
USER_NAME="$(whoami)"
local MACHINE
MACHINE="$(hostname -f 2>/dev/null || hostname)"
local OWNER="${USER_NAME}@${MACHINE}"

if [ -n "$COMMIT" ]; then
COMMIT="${COMMIT:0:8}"
EDK2_COMMIT="${EDK2_COMMIT:0:8}"

cat > Nexus5XPkg/Include/Resources/ReleaseInfo.h <<EOF
#ifndef __SMBIOS_RELEASE_INFO_H__
#define __SMBIOS_RELEASE_INFO_H__
#ifdef __IMPL_COMMIT_ID__
#undef __IMPL_COMMIT_ID__
#endif
#define __IMPL_COMMIT_ID__ "${COMMIT}"
#ifdef __RELEASE_DATE__
#undef __RELEASE_DATE__
#endif
#define __RELEASE_DATE__ "${DATE}"
#ifdef __BUILD_OWNER__
#undef __BUILD_OWNER__
#endif
#define __BUILD_OWNER__ "${OWNER}"
#ifdef __EDK2_RELEASE__
#undef __EDK2_RELEASE__
#endif
#define __EDK2_RELEASE__ "${EDK2_COMMIT}"
#endif
EOF
fi
}

# based on https://github.com/edk2-porting/edk2-msm/blob/master/build.sh#L47 
function _build() {
local DEVICE="${1}"
shift

_stamp_build

# Set environment again for legacy compatibility. On newer systems, GCC should be used from package source.
echo "Set legacy environment."
export PATH="/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-elf/bin:/opt/gcc-linaro-7.5.0-2019.12-x86_64_arm-eabi/bin:${PATH}"

# Probe GCC. Use the most suitable one.
# Equivalent of Get-GnuAarch64CrossCollectionPath -AllowFallback / Test-GnuAarch64CrossCollectionVersionRequirements
# from PsModules/elf.psm1 -- adjust CANDIDATE_PREFIXES below if your toolchain naming differs.
CANDIDATE_PREFIXES=(
"aarch64-linux-gnu-"
"aarch64-elf-"
"aarch64-none-elf-"
)

GCC_PREFIX=""
for prefix in "${CANDIDATE_PREFIXES[@]}"; do
if command -v "${prefix}gcc" >/dev/null 2>&1; then
GCC_PREFIX="$prefix"
break
fi
done

if [ -z "$GCC_PREFIX" ]; then
echo "Error: could not find a suitable AArch64 GCC cross toolchain." >&2
exit 1
fi

GCC_VERSION="$("${GCC_PREFIX}gcc" -dumpversion 2>/dev/null || echo "unknown")"
if [ "$GCC_VERSION" = "unknown" ]; then
echo "Warning: failed to check GCC version, build may fail!" >&2
fi

export GCC5_AARCH64_PREFIX="$GCC_PREFIX"
echo "Use GCC at ${GCC_PREFIX} (version ${GCC_VERSION}) to run builds."


make -C BootShim UEFI_BASE=0x00200000 UEFI_SIZE=0x00100000
if [ $? -ne 0 ]
then
echo "Failed to build BootShim" 1>&2
return 1
fi

source "../edk2/edksetup.sh"

NUM_CPUS=$((`getconf _NPROCESSORS_ONLN` + 2))

make clean -C ../edk2/BaseTools
make -C ../edk2/BaseTools -j$(nproc)

platforms=()

if [ "${DEVICE}" == 'All' ]
then
for PlatformName in "${AvailablePlatforms[@]}"
do
if [ "${PlatformName}" != 'All' ]
then
platforms+=("${PlatformName}")
fi
done
else
platforms+=("${DEVICE}")
fi

for PlatformName in "${platforms[@]}"
do
echo "Building uefi for ${PlatformName} (${BUILD_TYPE})"
#-a AARCH64 -p "Nexus5XPkg/${target}.dsc" -t GCC5
build -n "${NUM_CPUS}" -a AARCH64 -t GCC5 -p "Platforms/${PlatformName}/${PlatformName}.dsc" -b "${BUILD_TYPE}"

./build_boot_images.sh "${PlatformName}" "${BUILD_TYPE}"
done
}

_check_args "${device}"
if [ $IsValid == 1 ]
then
_clean
_build "${device}"
else
echo "Build: Invalid platform"
echo "Available targets: "
for Name in "${AvailablePlatforms[@]}"
do
echo " - ${Name}"
done
echo ""
echo "Options:"
echo "  -d <device>   Platform to build (Nexus5X | Nexus6P | All)"
echo "  --release     Build in RELEASE mode instead of DEBUG"
fi