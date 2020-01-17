#!/bin/bash


make clean && make distclean

./configure --prefix=/util/opt/hdf5/1.8.20/gcc/4.4.7 --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/gcc/4.4

make && make install
