#!/bin/bash

#PREFIX=/util/opt/netcdf-fortran/4.4.5/pgi/19.5
# for monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.0/pgi/19.5

module purge
module load compiler/pgi/19 netcdf-c/4.7 hdf5/1.10

make clean && make distclean

# configure won't find the various libs using PGI unless we do this
export LDFLAGS="${LDFLAGS} -L/util/opt/szip/2.1/pgi/19/lib -L/util/opt/zlib/1.2/pgi/19/lib -L/util/opt/hdf5/1.10/pgi/19/lib -L/util/opt/netcdf-c/4.7/pgi/19/lib"
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/pgi/19/lib"

./configure --prefix=${PREFIX}
make -j 4
make install
