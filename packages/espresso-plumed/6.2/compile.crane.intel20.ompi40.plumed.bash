#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.0 plumed/2.8 intel-mkl/20

PREFIX=/util/opt/espresso/6.2.0-plumed/openmpi/4.0.5/intel/20

make clean && make distclean
# MKL module defines MKLROOT
./configure --prefix=${PREFIX}   \
F90=ifort FC=ifort F77=ifort CC=icc MPIF90=mpif90 \
FFLAGS="-O2 -msse3" CFLAGS="-O2 -msse3" \
FFT_LIBS="-L${MKLROOT}/lib/intel64  -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm" \
BLAS_LIBS="-L${MKLROOT}/lib/intel64  -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm" \
LAPACK_LIBS="-L${MKLROOT}/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm" \
IFLAGS="-I../include -I${MKLROOT}/include -I${MKLROOT}/include/fftw -I/util/src/espresso/q-e-qe-6.2.0/include -I/util/src/espresso/q-e-qe-6.2.0/FoX/finclude" \
MOD_FLAG="/util/src/espresso/q-e-qe-6.2.0/include" #this needs to point to the include directory in the topdir

plumed patch --engine qespresso-6.2 -p

make pw
make install
