#!/bin/bash
  
module purge
module load compiler/gcc/9 openmpi/4.0 cmake/3.28 git/2.40 hdf5/1.12 libxml2/2.9 lapack/3.9 intel-mkl/19 wannier90/3.1

mkdir -p /util/opt/fleur/7.1/gcc/9/openmpi/4.0/bin/
export PREFIX=/util/opt/fleur/7.1/gcc/9/openmpi/4.0/

export CC="mpicc"
export CXX="mpicxx"
export FC="mpif90"

./configure.sh -c mpi -mpi TRUE -wannier TRUE -hdf5 TRUE \
-libdir /util/opt/wannier90/3.1/openmpi/4.0/gcc/9/lib/ \
-libdir /util/opt/lapack/3.9/gcc/9.1/lib/ \
-libdir /util/opt/openmpi/4.0/gcc/9/lib/ \
-libdir /util/opt/hdf5/1.12/gcc/9.1/lib/ \
-includedir /util/opt/openmpi/4.0/gcc/9/include/ \
-includedir /util/opt/hdf5/1.12/gcc/9.1/include/

cd build
make -j4

cp fleur_MPI $PREFIX/bin/
cp inpgen $PREFIX/bin/
