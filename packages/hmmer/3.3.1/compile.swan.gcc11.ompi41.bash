#!/bin/bash

module purge
module load compiler/gcc/11 openmpi/4.1 python/3.7

make distclean
./configure --prefix=/util/opt/BCRF/hmmer/3.3.1/openmpi/4.1/gcc/11 --enable-mpi
make
make check
make install
pushd easel
make install
