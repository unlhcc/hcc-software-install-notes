#!/bin/bash

module purge
module load compiler/gcc/9.1 openmpi/4.0 python/3.7

make distclean
./configure --prefix=/util/opt/BCRF/hmmer/3.3.1/openmpi/4.0.2/gcc/9.1.0 --enable-mpi
make
make check
make install
pushd easel
make distclean
./configure --prefix=/util/opt/BCRF/hmmer/3.3.1/openmpi/4.0.2/gcc/9.1.0
make
make install
