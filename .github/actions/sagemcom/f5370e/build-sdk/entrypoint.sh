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

if [ ! -z "$INPUT_VERSION" ]; then
    VERSION="_${INPUT_VERSION}"
fi


SAGEM_SDK_TAR=$INPUT_SDK_TAR
SAGEM_COMPILED_SDK_TAR=$INPUT_COMPILED_SDK_TAR 
mkdir -p $SAGEM_COMPILED_SDK_TAR

mkdir -p workdir
WORKDIR=$PWD/workdir


# Extract SDK tar file and copy to TOPDIR
cd ${SAGEM_SDK_TAR} 
tar xvf ${VERSION}_*.tar.bz2
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
tar cfz ${SAGEM_COMPILED_SDK_TAR}/${VERSION}_compiled_1.tgz *
