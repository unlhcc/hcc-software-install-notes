#!/bin/bash

module load compiler/intel/12
make clean && make distclean

export CFLAGS="$CFLAGS -fPIC"
# Build single-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/intel/12.1.6 --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/intel/12.1.6 --enable-sse2 --enable-avx --enable-shared=yes
make -j 4
make install
