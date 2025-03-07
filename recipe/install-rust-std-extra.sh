#!/bin/bash -e

cd rust-std-${rust_std_extra} && ./install.sh --prefix="${PREFIX}"

rm $PREFIX/lib/rustlib/manifest-rust-std-${rust_std_extra}
rm $PREFIX/lib/rustlib/rust-installer-version
rm $PREFIX/lib/rustlib/install.log
rm $PREFIX/lib/rustlib/components
rm $PREFIX/lib/rustlib/uninstall.sh
