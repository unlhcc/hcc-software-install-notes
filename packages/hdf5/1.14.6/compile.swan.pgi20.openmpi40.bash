#!/bin/bash

# following:
# https://software.pgi.com/content/www/us/en/develop/articles/performance-tools-for-software-developers-building-hdf5-with-pgi-compilers.html

PREFIX=/util/opt/hdf5/1.14.6/openmpi/4.0/pgi/20.4

module load compiler/pgi/20 openmpi/4.0 szip/2.1 zlib/1.2

export CFLAGS="-O3 -ip $CFLAGS"
echo $CFLAGS

export CC=mpicc
export CXX=mpic++
export FC=mpif90
export F77=mpif77

export CFLAGS="-fPIC"
export CXXFLAGS="-fPIC"
export FCFLAGS="-fPIC"

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-parallel \
 --with-szlib=$SZIP --with-zlib=$ZLIB --enable-build-mode=production

#make -j 4 && make install
