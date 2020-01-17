#!/bin/bash

module purge
module load compiler/gcc/9.1 openmpi/4.0
make clean && make distclean
export PREFIX=/util/opt/fftw3/3.3/gcc/9.1.0/openmpi/4.0.1
export CFLAGS="$CFLAGS -fPIC"

# Build single-precision version
./configure --prefix=${PREFIX} --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes --enable-mpi
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=${PREFIX} --enable-sse2 --enable-avx --enable-shared=yes --enable-mpi
make -j 4
make install
make clean && make distclean

# Build threads version
./configure --prefix=${PREFIX} --enable-sse2 --enable-avx --enable-shared=yes --enable-threads
make -j 4
make install
make clean && make distclean

