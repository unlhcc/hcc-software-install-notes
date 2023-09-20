#!/bin/bash

PREFIX=/util/opt/hdf5/1.12.0/gcc/11

module load compiler/gcc/11

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx \
 --with-szlib=/util/opt/szip/2.1/gcc/11 --with-zlib=/util/opt/zlib/1.2/gcc/11 --enable-build-mode=production

make -j 4 
make install
