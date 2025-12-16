ARG DEBIAN_VERSION=forky

FROM debian:${DEBIAN_VERSION}-slim

ARG CLANG_VERSION
ARG CMAKE_VERSION
ARG CPPCHECK_VERSION

# install base packages

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
        adduser \
        build-essential \
        ca-certificates \
        ccache \
        clang \
        cmake \
        curl \
        gdb \
        git \
        gnupg \
        lcov \
        lldb \
        llvm \
        lsb-release \
        make \
        ninja-build \
        pkg-config \
        python3 \
        python3-pip \
        python3-venv \
        sudo \
        tar \
        unzip \
        valgrind \
        wget \
        zip \
 && rm -rf /var/lib/apt/lists/*

# create passwordless user

RUN adduser --disabled-password --gecos '' user \
 && usermod -aG sudo user \
 && echo '%SUDO ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# install vcpkg, clang, cmake, cppcheck

ENV VCPKG_ROOT=/usr/local/vcpkg
ENV VCPKG_DOWNLOADS=/usr/local/vcpkg-downloads

COPY --chmod=755 install-*.sh /tmp/

RUN /tmp/install-vcpkg.sh user \
 && /tmp/install-clang.sh ${CLANG_VERSION} \
 && /tmp/install-cmake.sh ${CMAKE_VERSION} \
 && /tmp/install-cppcheck.sh ${CPPCHECK_VERSION} \
 && rm -f /tmp/install-*.sh

# add support for .lldbinit files in project root

COPY --chown=user:user user.lldbinit /home/user/.lldbinit
