#!/bin/bash

#PREFIX=/util/opt/netcdf-c/4.7.4/gcc/7.1.0
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/openmpi/4.0.5/gcc/7.1.0
module purge
module load compiler/gcc/7.1 openmpi/4.0 phdf5/1.12

# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/gcc/7.1/lib"
make clean && make distclean
CC=mpicc ./configure --prefix=${PREFIX} --enable-largefile --enable-netcdf4 --disable-v2 --disable-fsync --disable-dap
make -j 4
make install
