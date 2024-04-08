#!/bin/bash

set -ex

echo ${target_platform}

echo $PKG_NAME > ./components

$SRC_DIR/rust-std/install.sh --prefix="${PREFIX}"

rm "${PREFIX}"/lib/rustlib/install.log
