#!/bin/bash

module load compiler/gcc/8.2 openmpi/2.1
make clean && make distclean

export CFLAGS="$CFLAGS -fPIC"
# Build single-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/openmpi/2.1.6/gcc/8.2.0 --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes --enable-mpi
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=/util/opt/fftw3/3.3.3/openmpi/2.1.6/gcc/8.2.0 --enable-sse2 --enable-avx --enable-shared=yes --enable-mpi
make -j 4
make install
make clean && make distclean

# Build threads version
./configure --prefix=/util/opt/fftw3/3.3.3/openmpi/2.1.6/gcc/8.2.0 --enable-sse2 --enable-avx --enable-shared=yes --enable-threads
make -j 4
make install
make clean && make distclean
