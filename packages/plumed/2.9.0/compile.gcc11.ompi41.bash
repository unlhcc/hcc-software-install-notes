#!/bin/bash

module purge
module load compiler/gcc/11 openmpi/4.1 fftw3/3.3 zlib/1.2 python/3.8 GSL/2.6 intel-mkl/20

export CC=mpicc CXX=mpicxx FC=mpif90
export LDFLAGS="-L${ZLIB}/lib -L${FFTW3}/lib -L${GSL}/lib  -L${MKLROOT}/lib/intel64 -Wl,--no-as-needed -lmkl_intel_lp64 -lmkl_gnu_thread -lmkl_core -lgomp -lpthread -lm -ldl"

PREFIX=/util/opt/plumed/2.9.0/openmpi/4.1.3/gcc/11
make clean && make distclean
./configure --prefix=$PREFIX --enable-modules --enable-gsl --enable-fftw --enable-mpi --enable-zlib --enable-rpath --enable-modules=eds
#make -j 4
#make install
