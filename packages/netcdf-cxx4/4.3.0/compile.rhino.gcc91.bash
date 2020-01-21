#!/bin/bash

#PREFIX=/util/opt/netcdf-cxx4/4.3.0/gcc/9.1.0
# For monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.0/gcc/9.1.0

module purge
module load compiler/gcc/9.1 netcdf-c/4.7

make clean && make distclean

# The netcdf-c module provides the NCDIR var
CPPFLAGS="${CPPFLAGS} -I${NCDIR}/include"
LDFLAGS="${LDFLAGS} -L${NCDIR}/lib"

./configure --prefix=${PREFIX}
make -j 4
make install
