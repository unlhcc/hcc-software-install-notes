#!/bin/bash

rm -rf build && mkdir -p build && pushd build
cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/util/comp/clang/17.0.1 \
	-DCMAKE_BUILD_TYPE=Release ../llvm

make -j 4
make install
