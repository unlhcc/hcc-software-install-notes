#!/bin/bash

module load compiler/gcc/4.7 openmpi/1.8 szip zlib

make clean && make distclean

CC=mpicc \
CFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
FC=mpif90 \
FCFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
CXX=mpicxx \
CXXFLAGS="-DMPICH_IGNORE_CXX_SEEK" \

./configure --prefix=/util/opt/hdf5/1.8.20/openmpi/1.8/gcc/4.7 --enable-fortran --enable-parallel --with-szlib=/util/opt/szip/2.1/gcc/4.7 --with-zlib=/util/opt/zlib/1.2/gcc/4.7

#make && make install
make -j 4 install
#make && make check && make install
