FROM debian:stable-slim

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
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV CCACHE_DIR=/ccache
RUN mkdir /ccache && chmod 777 /ccache

CMD ["/bin/bash"]
