#!/bin/bash

module load compiler/gcc/4.8 openmpi/1.6
make clean && make distclean

PREFIX=/util/opt/mpiblast/1.6.0/gcc/4.8.2
MPIHOME=/util/opt/openmpi/1.6/gcc/4.8

./configure --prefix=$PREFIX --with-mpi=$MPIHOME
