#!/bin/bash
#
# inputs:
# - name: sagem-sdk-tar

# outputs:
# - name: sagem-compiled-sdk-tar
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

COMPILED_SDK_TAR=$PWD/${INPUT_COMPILED_SDK_TAR}
mkdir -p ${COMPILED_SDK_TAR}

mkdir -p workdir
WORKDIR=$PWD/workdir

# Extract SDK tar file and copy to TOPDIR
cd ${INPUT_SDK_TAR} 
tar xf ${INPUT_SDK_VERSION}*.tar.bz2
mv SG4*/* ${WORKDIR}
mv SG4*/.config ${WORKDIR}

# Build the SDK
chown --recursive developer:developer ${WORKDIR}
cd ${WORKDIR}
su developer -c make world
chown --recursive root:root ${WORKDIR}

# Rename to have more uniformed names
mv ${WORKDIR}/staging_dir/target-sagemcom*     ${WORKDIR}/staging_dir/target



# Tar everything
cd ${WORKDIR}

echo "Before tar"
pwd 
ls -l
ls -l ${INPUT_SDK_TAR}
ls -l ${WORKDIR}
ls -l ${COMPILED_SDK_TAR}
tar cfz ${COMPILED_SDK_TAR}/${INPUT_SDK_VERSION}_compiled.tgz *

echo "Output data"
pwd 
ls -l
ls -l ${INPUT_SDK_TAR}
ls -l ${WORKDIR}
ls -l ${COMPILED_SDK_TAR}

