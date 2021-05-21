#!/bin/bash

PREFIX=/util/opt/hdf5/1.12.0/intel/19.0.1

module load compiler/intel/19 szip/2.1 zlib/1.2

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx \
 --with-szlib=/util/opt/szip/2.1/intel/18 --with-zlib=/util/opt/zlib/1.2/intel/18 --enable-build-mode=production

make -j 4 
make install
