#!/bin/bash

#PREFIX=/util/opt/netcdf-c/4.7.4/gcc/8.2.0
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/gcc/8.2.0
module purge
module load compiler/gcc/8.2 hdf5/1.12

# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/gcc/8.2/lib"
make clean && make distclean
./configure --prefix=${PREFIX} --enable-largefile --enable-netcdf4
make -j 4
make install
