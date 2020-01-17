#!/bin/bash

module load compiler/gcc/4.9 openmpi/1.10

make clean && make distclean

CC=mpicc \
CFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
FC=mpif90 \
FCFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
CXX=mpicxx \
CXXFLAGS="-DMPICH_IGNORE_CXX_SEEK" \

./configure --prefix=/util/opt/hdf5/1.8.20/openmpi/1.10.2/gcc/4.9.2 --enable-fortran --enable-parallel --with-szlib=/util/opt/szip/2.1/gcc/4.9 --with-zlib=/util/opt/zlib/1.2/gcc/4.9

make -j 4 install

