#!/bin/bash

module purge
module load compiler/intel/19
make clean && make distclean

PREFIX=/util/opt/gsl/2.6/intel/19.0.1
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure --prefix=$PREFIX
make -j 4
make install
