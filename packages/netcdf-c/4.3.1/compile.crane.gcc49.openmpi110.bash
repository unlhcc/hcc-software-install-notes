#!/bin/bash

module load compiler/gcc/4.9 openmpi/1.10 szip/2.1 zlib/1.2 phdf5/1.8

make clean && make distclean

#CC=mpicc \
#LDFLAGS="-L/util/opt/hdf5/1.8/openmpi/gcc/4.9/lib" \
#CFLAGS="-DMPICH_IGNORE_CXX_SEEK" \
#CPPFLAGS="-I/util/opt/hdf5/1.8/openmpi/gcc/4.9/include" \

#  Have to do this instead of --with-hdf5=...
export CC=mpicc
export CXX=mpicxx
export FC=mpif90
export F77=mpif77
export CPPFLAGS='-I/util/opt/hdf5/1.8/openmpi/1.10/gcc/4.9/include -I/util/opt/szip/2.1/gcc/4.9/include -I/util/opt/zlib/1.2/gcc/4.9/include'
export CFLAGS="-DMPICH_IGNORE_CXX_SEEK"
export LDFLAGS='-L/util/opt/hdf5/1.8/openmpi/1.10/gcc/4.9/lib -L/util/opt/szip/2.1/gcc/4.9/lib -L/util/opt/zlib/1.2/gcc/4.9/lib'

./configure --prefix=/util/opt/netcdf/4.3/openmpi/1.10.2/gcc/4.9.2 --enable-largefile --enable-parallel --enable-netcdf-4 --disable-v2 --disable-fsync --disable-dap

make && make install

