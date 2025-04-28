#!/bin/bash -e

echo ${target_platform}

[[ ${target_platform} == osx-64 ]] && cp "${RECIPE_DIR}"/xcode-select .
PATH="${PWD}:$PATH" ./install.sh --prefix="${PREFIX}"

[[ `uname` == Darwin ]] && DSO_EXT='dylib' || DSO_EXT='so'

case "$(uname -sp)" in
"Linux aarch64")
    rust_arch="aarch64-unknown-linux-gnu"
    ;;
"Linux x86_64")
    rust_arch="x86_64-unknown-linux-gnu"
    ;;
"Darwin i386")
    rust_arch="x86_64-apple-darwin"
    ;;
"Darwin arm")
    rust_arch="aarch64-apple-darwin"
    ;;
*)
    rust_arch=""
    ;;
esac

# these files appear to be missing from the rustlib dir
ln -s ${PREFIX}/lib/librustc_driver-*.${DSO_EXT} ${PREFIX}/lib/rustlib/${rust_arch}/lib/
