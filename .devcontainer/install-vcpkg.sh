#!/usr/bin/env bash

set -e

USERNAME=${1:-"vscode"}

. /etc/os-release

export VCPKG_FORCE_SYSTEM_BINARIES=1

groupadd -r "vcpkg"
usermod -aG "vcpkg" "$USERNAME"

mkdir -p "$VCPKG_ROOT"
mkdir -p "$VCPKG_DOWNLOADS"

git clone --depth=1 \
    -c core.eol=lf \
    -c core.autocrlf=false \
    -c fsck.zeroPaddedFilemode=ignore \
    -c fetch.fsck.zeroPaddedFilemode=ignore \
    -c receive.fsck.zeroPaddedFilemode=ignore \
    https://github.com/microsoft/vcpkg "$VCPKG_ROOT"

"$VCPKG_ROOT"/bootstrap-vcpkg.sh

echo -e "export VCPKG_ROOT=\"$VCPKG_ROOT\"\nexport PATH=\"\$PATH:\$VCPKG_ROOT\"" >> /etc/bash.bashrc

chown -R ":vcpkg" "$VCPKG_ROOT" "$VCPKG_DOWNLOADS"
chmod g+r+w+s "$VCPKG_ROOT" "$VCPKG_DOWNLOADS"
chmod -R g+r+w "$VCPKG_ROOT" "$VCPKG_DOWNLOADS"
