#!/bin/bash

module load compiler/pgi/15 szip/2.1 zlib/1.2

make clean && make distclean

export F9X=pgf90

./configure --prefix=/util/opt/hdf5/1.8.20/pgi/15.10 --enable-fortran --enable-cxx  --with-szlib=/util/opt/szip/2.1/pgi/15/ --with-zlib=/util/opt/zlib/1.2/pgi/15/
#make && make check && make install
make && make install
