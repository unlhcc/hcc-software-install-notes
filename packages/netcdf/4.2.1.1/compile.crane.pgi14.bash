#!/bin/bash

module load compiler/pgi/14 szip/2.1 zlib/1.2 hdf5/1.8

make clean && make distclean

#  Have to do this instead of --with-hdf5=...
export CPPFLAGS='-I/util/opt/hdf5/1.8/pgi/14/include -I/util/opt/szip/2.1/pgi/14/include -I/util/opt/zlib/1.2/pgi/14/include'
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/hdf5/1.8.6/pgi/11.10/64/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/pgi/14/lib -L/util/opt/szip/2.1/pgi/14/lib -L/util/opt/zlib/1.2/pgi/14/lib'

./configure --prefix=/util/opt/netcdf/4.2.1.1/pgi/14 --enable-largefile --enable-netcdf4

make -j 4 install
