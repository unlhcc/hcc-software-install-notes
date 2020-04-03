#!/bin/bash

module purge
module load compiler/intel/19 openmpi/4.0
make clean && make distclean

PREFIX=/util/opt/nuwrf/v9/deps
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"
export LIBS="-lnetcdf -lhdf5_hl -lhdf5 -lz"
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export FCFLAGS="-fPIC $F90FLAGS"

./configure --disable-shared --prefix=$PREFIX --with-pic
make
make install
