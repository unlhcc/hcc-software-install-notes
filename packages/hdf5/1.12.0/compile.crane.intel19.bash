#!/bin/bash

# following:
# https://software.intel.com/content/www/us/en/develop/articles/performance-tools-for-software-developers-building-hdf5-with-intel-compilers.html

PREFIX=/util/opt/hdf5/1.12.0/intel/19.1

module load compiler/intel/19

export CFLAGS="-O3 -ip $CFLAGS"
echo $CFLAGS

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx \
 --with-szlib=/util/opt/szip/2.1.1/intel/19.1 --with-zlib=/util/opt/zlib/1.2.11/intel/19.1 --enable-build-mode=production

make -j 4 && make install
