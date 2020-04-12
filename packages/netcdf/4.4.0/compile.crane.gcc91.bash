#!/bin/bash

module load compiler/gcc/9.1 szip/2.1 zlib/1.2 hdf5/1.8

make clean && make distclean

#  Have to do this instead of --with-hdf5=...
export CPPFLAGS='-I/util/opt/hdf5/1.8/gcc/9.1/include -I/util/opt/szip/2.1/gcc/9.1/include -I/util/opt/zlib/1.2/gcc/9.1/include'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/hdf5/1.8/gcc/9.1/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/gcc/9.1/lib -L/util/opt/szip/2.1/gcc/9.1/lib -L/util/opt/zlib/1.2/gcc/9.1/lib'

./configure --prefix=/util/opt/netcdf/4.4/gcc/9.1.0 --enable-largefile --enable-netcdf4

#make && make install
