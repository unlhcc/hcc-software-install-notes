#!/bin/bash

module purge
module load compiler/gcc/11 openmpi/4.1 intel-mkl/19 make python/2.7

PREFIX=/util/opt/wannier90/3.1.3/openmpi/4.1.3/gcc/11

make clean
make veryclean

cp -f config/make.inc.gfort make.inc

export OPTS="COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch'"

#echo "OPTS are"
#echo $OPTS
#make -j 4 `echo ${OPTS}` default
#make -j 4 ${OPTS} lib
#make -j 4 ${OPTS} w90chk2chk
#make -j 4 ${OPTS} w90vdw
#make -j 4 ${OPTS} w90pov


make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' default
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' lib
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' w90chk2chk
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' w90vdw
make -j 4 COMMS=mpi MPIF90=mpif90 LIBDIR=$MKLROOT/lib/intel64 FCOPTS='-O3 -fallow-argument-mismatch' w90pov

make PREFIX=$PREFIX install
