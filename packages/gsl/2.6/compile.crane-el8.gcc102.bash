#!/bin/bash

module purge
module load compiler/gcc/10.2
make clean && make distclean

PREFIX=/util/opt/gsl/2.6/gcc/10.2.0
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure --prefix=$PREFIX
make -j 4
make install
