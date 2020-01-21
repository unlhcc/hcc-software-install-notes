#!/bin/bash

module load compiler/intel/16 szip/2.1 zlib/1.2 hdf5/1.8

make clean && make distclean

#  Have to do this instead of --with-hdf5=... because NetCDF is dumb
export CPPFLAGS='-I/util/opt/hdf5/1.8/intel/16/include -I/util/opt/szip/2.1/intel/16/include -I/util/opt/zlib/1.2/intel/16/include -I/util/opt/netcdf/4.4/intel/16/include  '
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/netcdf/4.4/intel/16/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/intel/16/lib -L/util/opt/szip/2.1/intel/16/lib -L/util/opt/zlib/1.2/intel/16/lib -L/util/opt/netcdf/4.4/intel/16/lib '

./configure --prefix=/util/opt/netcdf/4.4.3/intel/16.0.1 --enable-largefile

#make && make install

