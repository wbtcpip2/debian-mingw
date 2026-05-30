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
    libshaderc-dev \
    libtool \
    automake \
    autoconf \
    libglib2.0-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ⭐ PATCH: aggiorna Meson alla versione richiesta da fontconfig (>= 1.11)
RUN pip3 install --break-system-packages --upgrade meson

# Assicura che /usr/local/bin venga usato prima di /usr/bin
ENV PATH="/usr/local/bin:${PATH}"

ENV CCACHE_DIR=/ccache
RUN mkdir /ccache && chmod 777 /ccache

CMD ["/bin/bash"]
