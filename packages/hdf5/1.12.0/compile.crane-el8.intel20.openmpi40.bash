#!/bin/bash

# following:
# https://software.intel.com/content/www/us/en/develop/articles/performance-tools-for-software-developers-building-hdf5-with-intel-compilers.html

PREFIX=/util/opt/hdf5/1.12.0/openmpi/4.0.5/intel/19.1.3

module load compiler/intel/20 openmpi/4.0 szip/2.1 zlib/1.2

export CFLAGS="-O3 -ip $CFLAGS"
echo $CFLAGS

export CC=mpicc
export CXX=mpic++
export FC=mpif90

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-parallel \
 --with-szlib=$SZIP --with-zlib=$ZLIB --enable-build-mode=production

make -j 4 && make install
