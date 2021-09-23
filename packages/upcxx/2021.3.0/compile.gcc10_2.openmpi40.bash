#!/bin/bash

module purge
module load compiler/gcc/10.2 openmpi/4.0

PREFIX=/util/opt/upcxx/2021.3.0/openmpi/4.0.5/gcc/10.2.0/

make clean && make distclean
./configure --prefix=$PREFIX -with-default-network=ibv  \
   --enable-ofi --with-ofi-provider=psm2 --with-mpi-cc=`which mpicc` --with-cxx=mpicxx \
   --disable-ibv-xrc  --disable-ibv-odp
