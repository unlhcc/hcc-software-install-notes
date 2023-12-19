#!/bin/bash

module purge 
module load perl/5.26 compiler/intel/20 intel-mkl/20 openmpi/4.1 netcdf/4.7 libxc/5.2 GSL/2.6

mkdir -p /util/opt/octopus/13.0/openmpi/4.1/intel/20/
export PREFIX=/util/opt/octopus/13.0/openmpi/4.1/intel/20/

cd /util/src/octopus/octopus-13.0

export FCFLAGS_FFTW="-I$MKLROOT/include/fftw"

make clean && make distclean

./configure --prefix=$PREFIX CC=mpicc FC=mpif90 \
    --enable-mpi --enable-openmp --enable-newuoa --disable-avx512 \
    --with-blas="-mkl" \
    --with-scalapack="-mkl=parallel -lmkl_scalapack_lp64 -lmkl_blacs_openmpi_lp64" \
    --with-blacs="-mkl -lmkl_blacs_openmpi_lp64" \
    --with-fft-lib=$MKLROOT/interfaces/fftw3xf/libfftw3xf_intel.a \
    --with-libxc-prefix=$LIBXC \
    --with-netcdf-prefix="$NETCDF" \
    --with-gsl-prefix=$GSL

make -j4 
make install
