#!/bin/bash

module load compiler/intel/13

make clean && make distclean

./configure --prefix=/util/opt/hdf5/1.8.20/intel/13.1.3 --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/intel/13 --with-zlib=/util/opt/zlib/1.2/intel/13

#make && make check && make install
make && make install
