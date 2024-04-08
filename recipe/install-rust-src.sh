#!/bin/bash

set -ex

echo ${target_platform}

echo $PKG_NAME > ./components

$SRC_DIR/rust-src/install.sh --prefix="$PREFIX"

rm "${PREFIX}"/lib/rustlib/install.log
