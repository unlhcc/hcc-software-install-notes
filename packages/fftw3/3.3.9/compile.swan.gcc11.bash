#!/bin/bash

module purge
module load compiler/gcc/11 make
make clean && make distclean

PREFIX=/util/opt/fftw3/3.3.9/gcc/11
export CFLAGS="$CFLAGS -fPIC"

# Build single-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes --enable-threads --enable-openmp
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-shared=yes --enable-threads --enable-openmp
make -j 4
make install
