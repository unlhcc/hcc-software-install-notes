#!/bin/bash

module load compiler/pgi/15 szip/2.1 zlib/1.2 hdf5/1.8

make clean && make distclean

#  Have to do this instead of --with-hdf5=... because NetCDF is dumb
export CPPFLAGS='-I/util/opt/hdf5/1.8/pgi/15/include -I/util/opt/szip/2.1/pgi/15/include -I/util/opt/zlib/1.2/pgi/15/include '
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/netcdf/4.4/pgi/15/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/pgi/15/lib -L/util/opt/szip/2.1/pgi/15/lib -L/util/opt/zlib/1.2/pgi/15/lib '

./configure --prefix=/util/opt/netcdf/4.4.3/pgi/15.10 --enable-largefile --enable-netcdf4

#make && make install

