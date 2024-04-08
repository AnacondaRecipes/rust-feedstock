#!/bin/bash

set -ex

cd $SRC_DIR/rust-src

echo $PKG_NAME > ./components

PATH="${PWD}:$PATH" ./install.sh --prefix="$PREFIX"

rm "${PREFIX}"/lib/rustlib/components
rm "${PREFIX}"/lib/rustlib/install.log
rm "${PREFIX}"/lib/rustlib/rust-installer-version
rm "${PREFIX}"/lib/rustlib/uninstall.sh
