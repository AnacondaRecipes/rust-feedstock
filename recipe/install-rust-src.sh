#!/bin/bash -e

cd rust-src && ./install.sh --prefix="${PREFIX}"

# Installer bookkeeping shared with the other rust components; keep only the
# sources and manifest-rust-src so outputs do not clobber each other.
rm -f $PREFIX/lib/rustlib/rust-installer-version
rm -f $PREFIX/lib/rustlib/install.log
rm -f $PREFIX/lib/rustlib/components
rm -f $PREFIX/lib/rustlib/uninstall.sh
