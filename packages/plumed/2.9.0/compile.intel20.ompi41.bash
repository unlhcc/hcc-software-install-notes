#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 fftw3/3.3 zlib/1.2 python/3.8 GSL/2.6 intel-mkl/20

export CC=mpicc CXX=mpicxx FC=mpif90
export CFLAGS="$CFLAGS -mkl"
export CXXFLAGS="$CXXFLAGS -mkl"
export FCFLAGS="$FCFLAGS -mkl"
export LDFLAGS="-L${ZLIB}/lib -L${FFTW3}/lib -L${GSL}/lib"
#export LIBS="-lz -lfftw3 -lgsl"

PREFIX=/util/opt/plumed/2.9.0/openmpi/4.1.3/intel/20
make clean && make distclean
./configure --prefix=$PREFIX --enable-modules --enable-gsl --enable-fftw --enable-mpi --enable-zlib --enable-rpath --enable-modules=eds
#make -j 4
#make install
