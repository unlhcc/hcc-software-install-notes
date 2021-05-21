#!/bin/bash

#PREFIX=/util/opt/netcdf-fortran/4.4.5/gcc/4.9.2
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/openmpi/2.1/gcc/4.9.2
module purge
module load compiler/gcc/4.9 openmpi/2.1 phdf5/1.8
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export NCDIR=/util/opt/netcdf/4.7/openmpi/2.1/gcc/4.9
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/gcc/4.9/lib -L$NCDIR/lib" 
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export LIBRARY_PATH="$LD_LIBRARY_PATH:$NCDIR/lib"
export CPATH="$CPATH:$NCDIR/include"
export PATH="$PATH:$NCDIR/bin"

make clean && make distclean
./configure --prefix=${PREFIX}
make -j 4
make install
