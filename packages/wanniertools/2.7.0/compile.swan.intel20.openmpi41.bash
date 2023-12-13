#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20 arpack-ng/3.9

mkdir -p /util/opt/wanniertools/2.7.0/openmpi/4.1/intel/20/bin
export PREFIX=/util/opt/wanniertools/2.7.0/openmpi/4.1/intel/20/

cd /util/src/wanniertools/wannier_tools-2.7.0/src
cp Makefile.intel-mpi Makefile
# edit Makefile to change mpiifort to mpifort, set ARPACK and PREFIX 

make clean
make
