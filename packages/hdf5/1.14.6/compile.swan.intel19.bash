#!/bin/bash

PREFIX=/util/opt/hdf5/1.14.6/intel/19


module load compiler/intel/19 szip/2.1 zlib/1.2

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx \
 --with-szlib=$SZIP --with-zlib=$ZLIB --enable-build-mode=production

#make -j 4 
#make install
