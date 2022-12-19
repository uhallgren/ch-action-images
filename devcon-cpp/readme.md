# Development Container C++ image

This is an image that is to be used in the Development Container for C++. This is done to speed up
rebuild of the Dev Container in VSCode.
It builds on on the C++ Dev Container from Microsoft but adds some additional tools.

The command used to build

    docker buildx build --platform linux/amd64,linux/arm64 -t connectedhome/hc-devcon-cpp:latest  --push .