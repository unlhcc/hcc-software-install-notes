#!/bin/bash

module purge
module load compiler/gcc/10 openmpi/4.1 intel-mkl/19 make python/2.7

PREFIX=/util/opt/wannier90/3.1.3/openmpi/4.1.3/gcc/10

make clean
make veryclean

cp -f config/make.inc.gfort make.inc

make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' default
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' lib
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' w90chk2chk
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' w90vdw
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' w90pov

make PREFIX=$PREFIX install
