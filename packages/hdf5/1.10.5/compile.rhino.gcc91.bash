#!/bin/bash

PREFIX=/util/opt/hdf5/1.10.5/gcc/9.1.0

module load compiler/gcc/9.1

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/gcc/9.1 --with-zlib=/util/opt/zlib/1.2/gcc/9.1

make -j 4 && make install
