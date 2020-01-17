#!/bin/bash

module load compiler/gcc/4.8 openmpi

make clean && make distclean

CC=mpicc \
CFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
FC=mpif90 \
FCFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
CXX=mpicxx \
CXXFLAGS="-DMPICH_IGNORE_CXX_SEEK" \

./configure --prefix=/util/opt/hdf5/1.8.12/openmpi/gcc/4.8 --enable-parallel --with-szlib=/util/opt/szip/2.1/gcc/4.8

#make && make check && make install
