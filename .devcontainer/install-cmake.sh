#!/usr/bin/env bash

set -e

CMAKE_VERSION=${1:-"none"}

if [ "$CMAKE_VERSION" = "none" ]; then
    echo "No CMake version specified, skipping CMake installation"
    exit 0
fi

echo "Installing CMake $CMAKE_VERSION..."

apt-get update
apt-get -y purge --auto-remove cmake
TMP_DIR=$(mktemp -d -t cmake-XXXXXXXXXX)
cd "$TMP_DIR"
CMAKE_BINARY_NAME="cmake-$CMAKE_VERSION-linux-x86_64.sh"
CMAKE_CHECKSUM_NAME="cmake-$CMAKE_VERSION-SHA-256.txt"
curl -sSL "https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/$CMAKE_BINARY_NAME" -O
curl -sSL "https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/$CMAKE_CHECKSUM_NAME" -O
sha256sum -c --ignore-missing "$CMAKE_CHECKSUM_NAME"
mkdir -p /opt/cmake
sh "$TMP_DIR/$CMAKE_BINARY_NAME" --prefix=/opt/cmake --skip-license
rm -Rf "$TMP_DIR"
ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
ln -s /opt/cmake/bin/ctest /usr/local/bin/ctest
