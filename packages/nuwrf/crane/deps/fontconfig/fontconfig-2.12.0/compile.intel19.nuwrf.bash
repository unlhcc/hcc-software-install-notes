#!/bin/bash

module use /util/opt/hcc-modules/Common
module purge
module load compiler/intel/19 openmpi/4.0 python/2.7
make clean && make distclean
PREFIX=/util/opt/nuwrf/v9/deps
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure --enable-static --disable-shared --prefix=$PREFIX
make
make install
