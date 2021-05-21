#!/bin/bash

PREFIX=/util/opt/hdf5/1.12.0/gcc/10.2.0

module load compiler/gcc/10.2

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx \
 --with-szlib=/util/opt/szip/2.1/gcc/10.2 --with-zlib=/util/opt/zlib/1.2/gcc/10.2 --enable-build-mode=production

make -j 4 
make install
