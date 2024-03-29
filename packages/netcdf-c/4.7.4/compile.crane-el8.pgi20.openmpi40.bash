#!/bin/bash

#PREFIX=/util/opt/netcdf-c/4.7.4/pgi/10.2.0
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/openmpi/4.0.5/pgi/20.4
module purge
module load compiler/pgi/20 openmpi/4.0 phdf5/1.12

# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=${ZLIB}/lib -L${PHDF5}/lib"
export CC=mpicc FC=mpif90
export CFLAGS="$CFLAGS -fPIC" FCFLAGS="$FCFLAGS -fPIC" CXXFLAGS="$CXXFLAGS -fPIC"

make clean && make distclean
./configure --prefix=${PREFIX} --enable-largefile --enable-netcdf4 --disable-v2 --disable-fsync --disable-dap
make
make install
