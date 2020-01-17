#!/bin/bash

module load compiler/pgi/12

make clean && make distclean

export F9X=pgf90

./configure --prefix=/util/opt/hdf5/1.8.20/pgi/12.10 --enable-fortran --enable-cxx --with-szlib=/util/opt/szip/2.1/pgi/12 --with-zlib=/util/opt/zlib/1.2/pgi/12

make && make install
#make && make check && make install
