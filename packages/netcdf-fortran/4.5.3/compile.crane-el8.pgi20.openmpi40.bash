#!/bin/bash

#PREFIX=/util/opt/netcdf-fortran/4.4.5/pgi/10.2.0
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/openmpi/4.0.5/pgi/20.4
module purge
module load compiler/pgi/20 openmpi/4.0 phdf5/1.12
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export NCDIR=/util/opt/netcdf/4.7/openmpi/4.0/pgi/20
export LDFLAGS="${LDFLAGS} -Wl,-rpath=$ZLIB/lib -L$NCDIR/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export CPATH="$CPATH:$NCDIR/include"
export FC=mpif90 CC=mpicc
export CFLAGS="$CFLAGS -fPIC" FCFLAGS="$FCFLAGS -fPIC" CXXFLAGS="$CXXFLAGS -fPIC"

make clean && make distclean
./configure --prefix=${PREFIX}
make
make install
