#!/bin/bash

#PREFIX=/util/opt/netcdf-cxx4/4.3.0/pgi/19.5
# for monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.0/pgi/19.5

module purge
module load compiler/pgi/19 netcdf-c/4.7

make clean && make distclean

# The netcdf-c module provides the NCDIR var
CFLAGS="${CFLAGS} -I${NCDIR}/include -L${NCDIR}/lib"
CPPFLAGS="${CPPFLAGS} -I${NCDIR}/include -L${NCDIR}/lib"
LDFLAGS="${LDFLAGS} -L${NCDIR}/lib"
CXXFLAGS="${CXXFLAGS} -I${NCDIR}/include -L${NCDIR}/lib"

./configure --prefix=${PREFIX}
make -j 4
make install
