#!/bin/bash

module load compiler/gcc/9.1

make clean && make distclean

./configure --prefix=/util/opt/hdf5/1.8.20/gcc/9.1.0 --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/gcc/9.1 --with-zlib=/util/opt/zlib/1.2/gcc/9.1

make && make install
