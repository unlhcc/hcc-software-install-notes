#!/bin/bash

module purge
module load compiler/pgi/20
make clean && make distclean

export CFLAGS="$CFLAGS -fPIC"
PREFIX=/util/opt/fftw3/3.3.9/pgi/20.4

# Build single-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-shared=yes
make -j 4
make install
