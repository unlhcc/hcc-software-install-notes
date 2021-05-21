#!/bin/bash

#PREFIX=/util/opt/netcdf-c/4.7.4/gcc/4.9.2
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/openmpi/2.1.6/gcc/4.9.2
module purge
module load compiler/gcc/4.9 openmpi/2.1 phdf5/1.8

# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/gcc/4.9/lib"
make clean && make distclean
CC=mpicc ./configure --prefix=${PREFIX} --enable-largefile --enable-netcdf4 --disable-v2 --disable-fsync --disable-dap
make -j 4
make install
