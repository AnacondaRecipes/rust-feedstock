#!/bin/bash
set -ex

# rust-src must land in the sysroot of the rust-nightly it is pinned to.
sysroot="$(rustc --print sysroot)"
test -f "${sysroot}/lib/rustlib/src/rust/library/Cargo.lock"

# Rebuild std from these sources, as `cargo -Zbuild-std` consumers (bun) do.
host="$(rustc -vV | sed -n 's/^host: //p')"
linker_var="CARGO_TARGET_$(echo "${host}" | tr 'a-z-' 'A-Z_')_LINKER"
export "${linker_var}=${CC}"
export CARGO_HOME="${PWD}/cargo-home"
cargo new --vcs none --bin hello-build-std
cd hello-build-std
cargo build -Zbuild-std --target "${host}"
"./target/${host}/debug/hello-build-std" | grep -Fx "Hello, world!"
