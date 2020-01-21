#!/bin/bash

module load compiler/pgi/12 szip/2.1 zlib/1.2 hdf5/1.8

make clean && make distclean

#  Have to do this instead of --with-hdf5=... because NetCDF is dumb
export CPPFLAGS='-I/util/opt/hdf5/1.8/pgi/12/include -I/util/opt/szip/2.1/pgi/12/include -I/util/opt/zlib/1.2/pgi/12/include -I/util/opt/netcdf/4.2.1.1/pgi/12/include  '
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/netcdf/4.2.1.1/pgi/12/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/pgi/12/lib -L/util/opt/szip/2.1/pgi/12/lib -L/util/opt/zlib/1.2/pgi/12/lib -L/util/opt/netcdf/4.2.1.1/pgi/12/lib '

./configure --prefix=/util/opt/netcdf/4.2.1.1/pgi/12.10 --enable-largefile

make -j 4 install
