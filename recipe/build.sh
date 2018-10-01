#!/bin/bash -e

PATH="${PWD}:$PATH" ./install.sh --prefix=${PREFIX}

if [[ $target_platform == osx-64 ]]; then
  install_name_tool -change @rpath/libLLVM.dylib @loader_path/../../../libLLVM.dylib ${PREFIX}/lib/rustlib/x86_64-apple-darwin/lib/python2.7/site-packages/lldb/lldb-argdumper
  install_name_tool -change @rpath/libLLVM.dylib @loader_path/../../../libLLVM.dylib ${PREFIX}/lib/rustlib/x86_64-apple-darwin/lib/python2.7/site-packages/lldb/_lldb.so
elif [[ $target_platform =~ .*linux.* ]]; then
  pushd ${PREFIX}/lib/rustlib/x86_64-unknown-linux-gnu
  for EXE in bin/llvm-size \
             codegen-backends/librustc_codegen_llvm-emscripten.so \
             bin/llvm-nm \
             bin/llvm-readobj \
             bin/llvm-objcopy \
             bin/llvm-objdump \
             bin/llvm-strip \
             lib/libLLVM-8svn.so \
             bin/llvm-profdata \
             codegen-backends/librustc_codegen_llvm-llvm.so; do
    chrpath -d ${EXE}
    patchelf --force-rpath --set-rpath '$ORIGIN/../lib' ${EXE}
  done
fi
