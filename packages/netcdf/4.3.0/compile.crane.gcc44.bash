#!/bin/bash

make clean && make distclean

#  Have to do this instead of --with-hdf5=...
export CPPFLAGS='-I/util/opt/hdf5/1.8/gcc/4.4/include -I/util/opt/szip/2.1/gcc/4.4/include'
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/hdf5/1.8.6/gcc/11.10/64/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/gcc/4.4/lib -L/util/opt/szip/2.1/gcc/4.4/lib'

./configure --prefix=/util/opt/netcdf/4.3.0/gcc/4.4.7 --enable-largefile --enable-netcdf4

#make && make install

