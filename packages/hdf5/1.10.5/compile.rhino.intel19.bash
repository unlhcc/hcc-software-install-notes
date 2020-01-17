#!/bin/bash

PREFIX=/util/opt/hdf5/1.10.5/intel/19.0.1

module load compiler/intel/19

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/intel/19 --with-zlib=/util/opt/zlib/1.2/intel/19

make -j 4 && make install
