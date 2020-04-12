#!/bin/bash

module load compiler/intel/13 openmpi/1.6 szip/2.1

make clean && make distclean

#ZLIB
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/zlib/1.2.5/intel/13/lib
export INCLUDE=$INCLUDE:/util/opt/zlib/1.2.5/intel/13/include
#HDF5
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/hdf5/1.8.7/intel/13/lib
export INCLUDE=$INCLUDE:/util/opt/hdf5/1.8.7/intel/13/include

export CPPFLAGS='-I/util/opt/hdf5/1.8.7/intel/13/include -I/util/opt/szip/2.1/intel/13/include -I/util/opt/zlib/1.2.5/intel/13/include' 
export LDFLAGS='-L/util/opt/hdf5/1.8.7/intel/13/lib -L/util/opt/szip/2.1/intel/13/lib -L/util/opt/zlib/1.2.5/intel/13/lib'

./configure --prefix=/util/opt/netcdf/4.1.3/intel/13.1.3 --enable-largefile --enable-netcdf4 #--enable-pnetcdf 
make
make check
make install
