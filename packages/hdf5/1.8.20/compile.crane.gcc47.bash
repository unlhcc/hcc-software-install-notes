#!/bin/bash

module load compiler/gcc/4.7

make clean && make distclean

./configure --prefix=/util/opt/hdf5/1.8.20/gcc/4.7.3 --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/gcc/4.7 --with-zlib=/util/opt/zlib/1.2/gcc/4.7

make && make install
