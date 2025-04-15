#!/bin/bash

PREFIX=/util/opt/hdf5/1.14.6/openmpi/4.0/gcc/11

module load compiler/gcc/11 openmpi/4.0 szip/2.1 zlib/1.2

export CC=mpicc
export CXX=mpic++
export FC=mpif90

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-parallel \
 --with-szlib=$SZIP --with-zlib=$ZLIB --enable-build-mode=production

#make -j 4 && make install
