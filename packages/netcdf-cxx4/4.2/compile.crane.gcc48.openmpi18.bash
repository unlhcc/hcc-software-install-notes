#!/bin/bash

module load compiler/gcc/4.8 openmpi/1.8 szip/2.1 zlib/1.2 phdf5/1.8

make clean && make distclean

#CC=mpicc \
#LDFLAGS="-L/util/opt/hdf5/1.8/openmpi/gcc/4.8/lib" \
#CFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
#CPPFLAGS="-I/util/opt/hdf5/1.8/openmpi/gcc/4.8/include" \

#  Have to do this instead of --with-hdf5=... because NetCDF is dumb
export CC='mpicc'
export CPPFLAGS='-I/util/opt/hdf5/1.8/openmpi/gcc/4.8/include -I/util/opt/szip/2.1/gcc/4.8/include -I/util/opt/zlib/1.2/gcc/4.8/include -I/util/opt/netcdf/4.2.1.1/gcc/4.8/include'
export CFLAGS="-DMPICH_IGNORE_CXX_SEEK"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/netcdf/4.2.1.1/openmpi/1.8/gcc/4.8/lib
export LDFLAGS='-L/util/opt/hdf5/1.8/openmpi/gcc/4.8/lib -L/util/opt/szip/2.1/gcc/4.8/lib -L/util/opt/zlib/1.2/gcc/4.8/lib -L/util/opt/netcdf/4.2.1.1/gcc/4.8/lib'

./configure --prefix=/util/opt/netcdf/4.2.1.1/openmpi/1.8/gcc/4.8 --enable-largefile

make -j 8 install
