#!/bin/bash

module purge
module load compiler/pgi/20
make clean && make distclean
PREFIX=/util/opt/gsl/2.6/pgi/20.4
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure -prefix=$PREFIX
make
make install
