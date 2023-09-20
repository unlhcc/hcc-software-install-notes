#!/bin/bash

PREFIX=/util/opt/hdf5/1.12.0/openmpi/4.1.2/gcc/10

module load compiler/gcc/10 openmpi/4.1 szip/2.1 zlib/1.2

export CC=mpicc
export CXX=mpic++
export FC=mpif90

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-parallel \
 --with-szlib=$SZIP --with-zlib=$ZLIB --enable-build-mode=production

make -j 4 && make install
