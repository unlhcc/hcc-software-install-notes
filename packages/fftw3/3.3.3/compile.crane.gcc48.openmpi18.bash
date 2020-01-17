#!/bin/bash

module load compiler/gcc/4.8 openmpi/1.8
make clean && make distclean

export CFLAGS="$CFLAGS -fPIC"
# Build single-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/openmpi/1.8.4/gcc/4.8.2 --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes --enable-mpi
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/openmpi/1.8.4/gcc/4.8.2 --enable-sse2 --enable-avx --enable-shared=yes --enable-mpi
make -j 4
make install
