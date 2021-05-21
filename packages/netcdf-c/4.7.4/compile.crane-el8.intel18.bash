#!/bin/bash

#PREFIX=/util/opt/netcdf-c/4.7.4/intel/19.0.1
# for monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/intel/18.0.6

module purge
module load compiler/intel/18 hdf5/1.12
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/intel/18/lib"
make clean && make distclean
./configure --prefix=${PREFIX} --enable-largefile --enable-netcdf4
make -j 4
make install
