#!/bin/bash

rm -rf build && mkdir -p build && pushd build
PREFIX=/util/opt/mmseqs2/13.45111/gcc/10.2.0/openmpi/4.0.5

module purge
module load compiler/gcc/10.2 openmpi/4.0 cmake/3.17 binutils/2.30
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE="RELEASE" \
  -DHAVE_MPI=1 -DHAVE_SSE4_1=1 -DNATIVE_ARCH=0 \
  -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" ..

make -j 2
make install
