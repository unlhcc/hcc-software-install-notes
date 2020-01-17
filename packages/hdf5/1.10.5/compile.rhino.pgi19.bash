#!/bin/bash

PREFIX=/util/opt/hdf5/1.10.5/pgi/19.5

module load compiler/pgi/19

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/pgi/19 --with-zlib=/util/opt/zlib/1.2/pgi/19

make -j 4 && make install
