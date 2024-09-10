#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/OrionOS-prjkt/android -b 14.0
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/romiyusnandar/local_manifest -b sweet-wip .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=romi.yusna
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
# lunch orion_sweet-ap2a-userdebug
breakfast sweet
echo "============="

# Build rom
mka space
