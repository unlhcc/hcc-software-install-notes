#!/bin/bash

module load compiler/gcc/4.7 szip/2.1 zlib/1.2 hdf5/1.8

make clean && make distclean

#  Have to do this instead of --with-hdf5=... because NetCDF is dumb
export CPPFLAGS='-I/util/opt/hdf5/1.8/gcc/4.7/include -I/util/opt/szip/2.1/gcc/4.7/include -I/util/opt/zlib/1.2/gcc/4.7/include -I/util/opt/netcdf/4.2.1.1/gcc/4.7/include'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/netcdf/4.2.1.1/gcc/4.7/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/gcc/4.7/lib -L/util/opt/szip/2.1/gcc/4.7/lib -L/util/opt/zlib/1.2/gcc/4.7/lib -L/util/opt/netcdf/4.2.1.1/gcc/4.7/lib'

./configure --prefix=/util/opt/netcdf/4.2.1.1/gcc/4.7.3 --enable-largefile

make -j 4 install
