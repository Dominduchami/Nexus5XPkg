. Tools/CI/Builder/build_boot_shim.sh
cd ../edk2
. rundbbuild.sh --nexus5x --development
cd ../Nexus5XPkg/
./build_boot_images.sh
