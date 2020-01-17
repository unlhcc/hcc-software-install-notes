#!/bin/bash

module load compiler/gcc/4.8

make clean && make distclean

./configure --prefix=/util/opt/hdf5/1.8.20/gcc/4.8.2 --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/gcc/4.8 --with-zlib=/util/opt/zlib/1.2/gcc/4.8

make && make install
