#!/bin/bash

module purge
module load compiler/intel/19 openmpi/4.0
make clean && make distclean

PREFIX=/util/opt/nuwrf/v9/deps
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"
export LIBS="-lhdf5_hl -lhdf5 -lz"

./configure --disable-shared --prefix=$PREFIX \
 --enable-netcdf4 --enable-large-file-tests \
 --disable-dap
make
#make install
