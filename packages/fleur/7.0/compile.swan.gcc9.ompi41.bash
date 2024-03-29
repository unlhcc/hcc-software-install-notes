#!/bin/bash
  
module purge
module load compiler/gcc/9  openmpi/4.1 cmake/3.28 git  hdf5/1.12 libxml2/2.9 lapack/3.9

#set -ex

export CC="mpicc"
export CXX="mpicxx"
export FC="mpif90"


mkdir -p /util/opt/fleur/7.0/gcc/9/openmpi/4.1/bin

PREFIX=/util/opt/fleur/7.0/gcc/9/openmpi/4.1/


./configure.sh -c mpi -mpi TRUE
cd build;

make -j 4

cp build/fleur_MPI ${PREFIX}/bin
cp build/inpgen ${PREFIX}/bin
