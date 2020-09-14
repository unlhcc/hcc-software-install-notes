#!/bin/bash

PREFIX=/util/opt/hdf5/1.12.0/pgi/20.4

module load compiler/pgi/20

make clean && make distclean

./configure --prefix=${PREFIX} --enable-fortran --enable-cxx \
 --with-szlib=/util/opt/szip/2.1.1/pgi/20 --with-zlib=/util/opt/zlib/1.2.11/pgi/20 --enable-build-mode=production

#make -j 4 && make install
