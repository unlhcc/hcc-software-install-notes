#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.0 intel-mkl/20 make python/2.7

PREFIX=/util/opt/wannier90/3.1.3/openmpi/4.0.5/intel/19.1.3

make clean
make veryclean

cp -f config/make.inc.ifort make.inc
make -j 4 MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 default
make -j 4 MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 lib
make -j 4 MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 w90chk2chk
make -j 4 MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 w90vdw
make -j 4 MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 w90pov

make PREFIX=$PREFIX install
