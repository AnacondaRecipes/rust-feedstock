#!/bin/bash -e

cd rust-std-${rust_std_extra} && ./install.sh --prefix="${PREFIX}"

rm -f $PREFIX/lib/rustlib/manifest-rust-std-${rust_std_extra}
rm -f $PREFIX/lib/rustlib/rust-installer-version
rm -f $PREFIX/lib/rustlib/install.log
rm -f $PREFIX/lib/rustlib/components
rm -f $PREFIX/lib/rustlib/uninstall.sh
