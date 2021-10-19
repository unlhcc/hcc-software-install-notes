#!/bin/bash

# following:
# https://software.intel.com/content/www/us/en/develop/articles/performance-tools-for-software-developers-building-hdf5-with-intel-compilers.html

PREFIX=/util/opt/hdf5/1.8.20/intel-mpi/2019.10.317/intel/19.0.8

module load compiler/intel/19 intel-mpi/19 szip/2.1 zlib/1.2

export CFLAGS="-O3 -ip $CFLAGS"
echo $CFLAGS

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-parallel \
 --with-szlib=$SZIP --with-zlib=$ZLIB --enable-build-mode=production

make -j 4 && make install
