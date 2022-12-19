# Build muon from source.
# This is an alternative meson implementation that is used by the meson
# extension in VSCode
FROM ubuntu:22.04 AS muon

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get --yes install --no-install-recommends \
        build-essential \
        ca-certificates \
        git \
        meson \
        ninja-build \
        sudo \
    && rm -rf /var/lib/apt/lists/*

COPY  install_muon.sh /
RUN bash -c "/install_muon.sh"


# Build the Development Container.
# This is derived from a Microsoft container to include the needed
# support for connectiona dn VSCode extension.
FROM mcr.microsoft.com/devcontainers/cpp:0-ubuntu-22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get --yes install --no-install-recommends \
        build-essential \
        clang-format \
        clang-tidy \
        cmake \
        doxygen \
        git \
        graphviz \
        libcurl4-openssl-dev \
        libgtest-dev \
        meson \
        ninja-build \
        pkg-config \
        sudo \
    && rm -rf /var/lib/apt/lists/*
    
    COPY --from=muon /usr/local /usr/local/


