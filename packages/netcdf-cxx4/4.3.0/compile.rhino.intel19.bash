#!/bin/bash

#PREFIX=/util/opt/netcdf-cxx4/4.3.0/intel/19.0.1
# for monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.0/intel/19.0.1

module purge
module load compiler/intel/19 netcdf-c/4.7

make clean && make distclean

# The netcdf-c module provides the NCDIR var
CPPFLAGS="${CPPFLAGS} -I${NCDIR}/include"
LDFLAGS="${LDFLAGS} -L${NCDIR}/lib"

./configure --prefix=${PREFIX}
make -j 4
make install
