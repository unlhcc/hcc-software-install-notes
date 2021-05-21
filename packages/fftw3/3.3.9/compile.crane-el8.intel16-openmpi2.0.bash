#!/bin/bash

module load compiler/intel/16 openmpi/2.0
make clean && make distclean
export PREFIX=/util/opt/fftw3/3.3.9/openmpi/2.0.4/intel/16.0.3
export CFLAGS="$CFLAGS -fPIC"

# Build single-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-float --enable-sse --enable-shared=yes --enable-mpi --enable-threads --enable-openmp
make -j 4
make install
make clean && make distclean

# Build double-precision version
./configure --prefix=$PREFIX --enable-sse2 --enable-avx --enable-shared=yes --enable-mpi --enable-threads --enable-openmp
make -j 4
make install
