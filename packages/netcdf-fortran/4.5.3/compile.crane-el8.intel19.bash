#!/bin/bash

#PREFIX=/util/opt/netcdf-fortran/4.4.5/intel/19.0
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/intel/19.0.1
module purge
module load compiler/intel/19 hdf5/1.12
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export NCDIR=/util/opt/netcdf/4.7/intel/19
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/intel/19/lib -L$NCDIR/lib" 
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export CPATH="$CPATH:$NCDIR/include"

make clean && make distclean
./configure --prefix=${PREFIX}
make -j 4
make install
