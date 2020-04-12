#!/bin/bash

module load compiler/intel/12 szip/2.1 zlib/1.2 hdf5/1.8

make clean && make distclean

#  Have to do this instead of --with-hdf5=...
export CPPFLAGS='-I/util/opt/hdf5/1.8/intel/12/include -I/util/opt/szip/2.1/intel/12/include -I/util/opt/zlib/1.2/intel/12/include -I/util/opt/netcdf/4.2.1.1/intel/12/include  '
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/netcdf/4.2.1.1/intel/12/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/intel/12/lib -L/util/opt/szip/2.1/intel/12/lib -L/util/opt/zlib/1.2/intel/12/lib -L/util/opt/netcdf/4.2.1.1/intel/12/lib '

./configure --prefix=/util/opt/netcdf/4.2.1.1/intel/12.1.6 --enable-largefile

make -j 4 install
