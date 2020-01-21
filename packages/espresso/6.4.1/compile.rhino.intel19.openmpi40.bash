#!/bin/bash

module load compiler/intel/19 intel-mkl/19 openmpi/4.0
# MKL module defines MKLROOT

PREFIX=/util/opt/espresso/6.4.1/openmpi/4.0.1/intel/19.0.1
make clean && make distclean

./configure --prefix=${PREFIX} \
F90=ifort FC=ifort F77=ifort CC=icc MPIF90=mpif90 \
FFLAGS="-O2 -msse3" CFLAGS="-O2 -msse3" \
FFT_LIBS="-L${MKLROOT}/intel64/lib  -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm" \
BLAS_LIBS="-L${MKLROOT}/intel64/lib  -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm" \
LAPACK_LIBS="-L${MKLROOT}/intel64/lib -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lpthread -lm" \
IFLAGS="-I../include -I${MKLROOT}/include -I${MKLROOT}/include/fftw -I/util/src/quantum-espresso/qe-6.4.1/include" \
MOD_FLAG="/util/src/espresso/qe-6.4.1/include" #this needs to point to the include directory in the topdir

make all
make install

