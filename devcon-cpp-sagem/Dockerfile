
FROM connectedhome/hc-devcon-cpp:main 

# Extract the compiled SDK
COPY SG4T1E100008S_compiled.tgz /
RUN mkdir -p /usr/local/sdk 
WORKDIR /usr/local/sdk 
RUN tar xf /SG4T1E100008S_compiled.tgz
RUN rm -f /SG4T1E100008S_compiled.tgz

# Install the default cross-file
RUN mkdir -p /usr/local/share/meson/cross 
COPY default /usr/local/share/meson/cross/

ENV PATH="${PATH}:/usr/local/sdk/precompiled_toolchain/gcc-v5.5-2019.03.2/arm-scos-linux-gnueabi/bin"
