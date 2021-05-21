#!/bin/bash

module purge
module load compiler/gcc/5.4

make clean && make distclean

./configure --prefix=/util/opt/hdf5/1.8.20/gcc/5.4.0 --enable-fortran --enable-cxx
 --with-szlib=/util/opt/szip/2.1/gcc/5.4 --with-zlib=/util/opt/zlib/1.2/gcc/5.4

make && make install
