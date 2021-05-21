#!/bin/bash

module purge
module load compiler/intel/13
make clean && make distclean

PREFIX=/util/opt/fftw3/3.3.9/intel/13.1.3
export CFLAGS="$CFLAGS -fPIC"

# Build single-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-shared=yes
make -j 4
make install
