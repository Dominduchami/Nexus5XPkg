#!/usr/bin/env bash
# Copyright 2018-2019, Bingxing Wang <uefi-oss-projects@imbushuo.net>
# Copyright 2026, HtcLeoRevivalProject
#
# This script builds EDK2 content.
# EDK2 setup script should be called before invoking this script.
#

set -u

CLEAN=0
RELEASE=0

for arg in "$@"; do
    case "$arg" in
        --clean) CLEAN=1 ;;
        --release) RELEASE=1 ;;
        *)
            echo "Unknown argument: $arg" >&2
            echo "Usage: $0 [--clean] [--release]" >&2
            exit 1
            ;;
    esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Task: EDK2 build"

# Targets. Ensure corresponding DSC/FDF files exist
# Build all targets on VSTS (phasing out Travis right now) or if user asks to do so
if [ -n "${BUILDALL:-}" ]; then
    echo "User requested build all available targets."
    AVAILABLE_TARGETS=("Nexus6P" "Nexus5X")
fi

if [ -n "${BUILD_BULLHEAD:-}" ]; then
    echo "User requested build bullhead."
    AVAILABLE_TARGETS=("Nexus5X")
fi

if [ -n "${BUILD_ANGLER:-}" ]; then
    echo "User requested build angler."
    AVAILABLE_TARGETS=("Nexus6P")
fi

if [ -z "${AVAILABLE_TARGETS+x}" ]; then
    echo "No target selected. Set BUILDALL, BUILD_BULLHEAD, or BUILD_ANGLER." >&2
    exit 1
fi

# Check package path.
if [ ! -d "Nexus5XPkg" ]; then
    echo "Error: Nexus5XPkg is not found." >&2
    exit 1
fi

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

# Probe iASL
# iasl_path="$(command -v iasl || true)"
# if [ -z "$iasl_path" ]; then exit 1; fi
# echo "Use iASL at ${iasl_path} to compile SSDTs."

# Build base tools if not exist (dev).
if [ ! -d "BaseTools" ] || [ "$CLEAN" -eq 1 ]; then
    echo "Build base tools."
    make -C BaseTools
    if [ $? -ne 0 ]; then
        echo "Error: Base tools target failed." >&2
        exit 1
    fi
fi

if [ "$CLEAN" -eq 1 ]; then
    for target in "${AVAILABLE_TARGETS[@]}"; do
        echo "Clean target ${target}."

        if [ "$RELEASE" -eq 1 ]; then
            build -a AARCH64 -p "Nexus5XPkg/${target}.dsc" -t GCC5 clean -b RELEASE
        else
            build -a AARCH64 -p "Nexus5XPkg/${target}.dsc" -t GCC5 clean
        fi

        if [ $? -ne 0 ]; then
            echo "Error: Clean target ${target} failed." >&2
            exit 1
        fi
    done

    # Apply workaround for "NUL"
    find Build -type f -name "NUL" -exec rm -f {} \; 2>/dev/null
fi

# Check current commit ID and write it into file for SMBIOS reference. (Trim it)
# Check current date and write it into file for SMBIOS reference too. (MM/dd/yyyy)
echo "Stamp build."
# This one is EDK2 base commit
EDK2_COMMIT="$(git rev-parse HEAD)"
# This is Nexus5XPkg package commit
COMMIT="$(cd Nexus5XPkg && git rev-parse HEAD)"
DATE="$(date +%m/%d/%Y)"
USER_NAME="$(whoami)"
MACHINE="$(hostname -f 2>/dev/null || hostname)"
OWNER="${USER_NAME}@${MACHINE}"

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

# Build SSDT tables
# Because this is quick enough, we build for any possible platforms
# for ssdt in Nexus5XPkg/AcpiTables/**/src/SSDT*.asl; do
#     [ -e "$ssdt" ] || continue
#     echo "Build ${ssdt}."
#     src_dir="$(dirname "$ssdt")"
#     file_name="$(basename "${ssdt%.asl}")"
#     out_dir="${src_dir}/../generated"
#     mkdir -p "$out_dir"
#     "$iasl_path" -p "${out_dir}/${file_name}.aml" "$ssdt"
#     if [ $? -ne 0 ]; then
#         echo "Error: Build SSDT ${ssdt} failed." >&2
#         exit 1
#     fi
# done

for target in "${AVAILABLE_TARGETS[@]}"; do
    echo "Build Nexus5XPkg for ${target} (Release = $([ "$RELEASE" -eq 1 ] && echo true || echo false))."
    if [ "$RELEASE" -eq 1 ]; then
        build -a AARCH64 -p "Nexus5XPkg/${target}.dsc" -t GCC5 -b RELEASE
    else
        build -a AARCH64 -p "Nexus5XPkg/${target}.dsc" -t GCC5
    fi

    if [ $? -ne 0 ]; then
        echo "Error: Build target ${target} failed." >&2
        exit 1
    fi
done
