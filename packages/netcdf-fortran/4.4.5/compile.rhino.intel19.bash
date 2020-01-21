#!/bin/bash

#PREFIX=/util/opt/netcdf-fortran/4.4.5/intel/19.0.1
# for monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.0/intel/19.0.1

module purge
module load compiler/intel/19 netcdf-c/4.7 hdf5/1.10

# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/intel/19/lib"

make clean && make distclean
./configure --prefix=${PREFIX}
make -j 4
make install
