#!/bin/bash
module purge
module load compiler/intel/18 openmpi/4.1
make clean && make distclean
export PREFIX=/util/opt/fftw3/3.3.9/openmpi/4.1.2/intel/18.0.6
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
