#!/bin/bash

module purge
module load compiler/intel/19 openmpi/4.0
make clean && make distclean

PREFIX=/util/opt/nuwrf/v9/deps
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
export PATH=${PREFIX}/bin:$PATH
export LD_LIBRARY_PATH=${PREFIX}/lib:$LD_LIBRARY_PATH
export INCLUDE=${PREFIX}/include:$INCLUDE
export ax_cv_c_float_words_bigendian=no
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure --disable-atomic --disable-shared --prefix=$PREFIX
make -j 4
make install
