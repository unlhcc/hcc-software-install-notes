#!/bin/bash

module purge
module load compiler/gcc/9.1
make clean && make distclean

export CFLAGS="$CFLAGS -fPIC"
# Build single-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/gcc/9.1.0 --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/gcc/9.1.0 --enable-sse2 --enable-avx --enable-shared=yes
make -j 4
make install
