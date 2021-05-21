#!/bin/bash

#PREFIX=/util/opt/netcdf-fortran/4.4.5/gcc/7.1.0
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/openmpi/4.0.5/gcc/7.1.0
module purge
module load compiler/gcc/7.1 openmpi/4.0 phdf5/1.12
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export NCDIR=/util/opt/netcdf/4.7/openmpi/4.0/gcc/7.1
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/gcc/7.1/lib -L$NCDIR/lib" 
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export CPATH="$CPATH:$NCDIR/include"

make clean && make distclean
CC=mpicc ./configure --prefix=${PREFIX}
make -j 4
make install
