#!/bin/bash -e

cd rust-std && ./install.sh --prefix="${PREFIX}"

rm -f $PREFIX/lib/rustlib/manifest-rust-std-${rust_arch}
rm -f $PREFIX/lib/rustlib/rust-installer-version
rm -f $PREFIX/lib/rustlib/install.log
rm -f $PREFIX/lib/rustlib/components
rm -f $PREFIX/lib/rustlib/uninstall.sh
