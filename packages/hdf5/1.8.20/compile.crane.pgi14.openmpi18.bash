#!/bin/bash

module load compiler/pgi/14 openmpi/1.8 szip/2.1 zlib/1.2

make clean && make distclean

CC=mpicc \
CFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
FC=mpif90 \
FCFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
CXX=mpicxx \
CXXFLAGS="-DMPICH_IGNORE_CXX_SEEK" \

./configure --prefix=/util/opt/hdf5/1.8.20/openmpi/1.8/pgi/14 --enable-fortran --enable-parallel --with-szlib=/util/opt/szip/2.1/pgi/14/ --with-zlib=/util/opt/zlib/1.2/pgi/14/

make -j 4 install
