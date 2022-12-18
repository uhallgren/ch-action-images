#
# toolchain file for cross compilation.
#
#
# Example of usage:
#   mkdir ../build
#   cd ../build 
#   arm cmake -DCMAKE_TOOLCHAIN_FILE=../example/toolchain.cmake ../example
#   arm cmake --build . --target all
#   arm cmake --build . --target build-ipk
#
set(TOPDIR /usr/local/sdk)
set(STAGING_DIR ${TOPDIR}/staging_dir/target)
set(TOOLCHAIN ${TOPDIR}/precompiled_toolchain/gcc-v5.5-2019.03.2/arm-scos-linux-gnueabi)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR arm)

# specify the cross compiler
set(CMAKE_C_COMPILER   ${TOOLCHAIN}/bin/arm-scos-linux-gnueabi-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN}/bin/arm-scos-linux-gnueabi-g++)

# specify how CMake locates resources
set(CMAKE_FIND_ROOT_PATH  ${STAGING_DIR})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# specify target OS and version
set(SWAN 1)
set(SDK_VERSION {VERSION})
