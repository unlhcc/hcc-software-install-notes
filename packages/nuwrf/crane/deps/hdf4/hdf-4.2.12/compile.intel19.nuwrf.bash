#!/bin/bash

module purge
module load compiler/intel/19 openmpi/4.0
make clean && make distclean
PREFIX=/util/opt/nuwrf/v9/deps
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure --disable-shared --prefix=$PREFIX \
            --enable-production --enable-fortran \
            --disable-netcdf \
            --with-zlib=$PREFIX \
            --with-jpeg=$PREFIX \
            --with-szlib=$PREFIX
make
make install
