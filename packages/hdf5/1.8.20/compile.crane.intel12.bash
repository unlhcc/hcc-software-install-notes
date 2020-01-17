#!/bin/bash

module load compiler/intel/12

make clean && make distclean

./configure --prefix=/util/opt/hdf5/1.8.20/intel/12.1.6 --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/intel/12 --with-zlib=/util/opt/zlib/1.2/intel/12

make && make install
