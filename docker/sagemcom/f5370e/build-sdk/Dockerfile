FROM ubuntu:20.04

ENV TZ=Europe/Stockholm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install the needed packages
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    build-essential \ 
    cmake \
    curl \
    emacs \
    file \
    flex \
    gawk \
    git \
    g++ \
    iputils-ping \
    libncurses5-dev \
    libssl-dev \
    locales \
    make \
    net-tools \
    openssh-client \
    openssl \
    ca-certificates \
    patch \
    pkg-config \
    python \
    python3 \
    subversion \
    sudo \
    unzip  \
    vim \
    wget  \
    xz-utils \
    zlib1g-dev  \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    libc6-dev-i386 \
    libxml2-dev \ 
    libxslt-dev \
    xsltproc \
    sharutils \
    autopoint \
    xmlto \
    dos2unix \
    tzdata \
    && rm -rf /var/lib/apt/lists/*


RUN useradd -m developer 

# Ensure UTF-8 locale
COPY locale /etc/default/locale
RUN locale-gen en_US.UTF-8 \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
