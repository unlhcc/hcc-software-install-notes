#!/bin/bash

module load compiler/intel/18 szip/2.1 zlib/1.2

make clean && make distclean

#CC=mpicc \
#CFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
#FC=mpif90 \
#FCFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
#CXX=mpicxx \
#CXXFLAGS="-DMPICH_IGNORE_CXX_SEEK" \

#./configure --prefix=/util/opt/hdf5/1.8.12/openmpi/pgi/15 --enable-fortran --enable-parallel --with-szlib=/util/opt/szip/2.1/intel/15/ --with-zlib=/util/opt/zlib/1.2/intel/15/
./configure --prefix=/util/opt/hdf5/1.8.20/intel/18.0.1 --enable-fortran --enable-cxx --enable-static --with-szlib=/util/opt/szip/2.1/intel/18 --with-zlib=/util/opt/zlib/1.2/intel/18

make -j 8 install
