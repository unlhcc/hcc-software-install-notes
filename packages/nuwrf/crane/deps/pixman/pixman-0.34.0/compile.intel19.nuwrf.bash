#!/bin/bash

module purge
module load compiler/intel/19 openmpi/4.0
make clean && make distclean
PREFIX=/util/opt/nuwrf/v9/deps
export PKG_CONFIG_PATH=/util/opt/nuwrf/v9/deps/lib/pkgconfig
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure --disable-shared --prefix=$PREFIX
make
make install
