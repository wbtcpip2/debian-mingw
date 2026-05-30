FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    python3 \
    python3-pip \
    ninja-build \
    meson \
    cmake \
    yasm \
    nasm \
    gperf \
    pkg-config \
    ccache \
    mingw-w64 \
    p7zip-full \
    texinfo \
    file \
    flex \
    bison \
    gawk \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    zlib1g-dev \
    ragel \
    python3-cairo \
    shaderc \
    libtool \
    automake \
    autoconf \
    libglib2.0-dev \
    xz-utils \
    gettext \
    help2man \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages --upgrade meson ninja

ENV CCACHE_DIR=/ccache
RUN mkdir /ccache && chmod 777 /ccache

CMD ["/bin/bash"]
