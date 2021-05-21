#!/bin/bash

module purge
module load compiler/gcc/5.4 hdf5/1.8 intel-mkl/18 cmake/3.17

PREFIX=/util/opt/armadillo/10.3.2/gcc/5.4.0
export CXXFLAGS="$CXXFLAGS -std=c++11"

rm -rf build && mkdir build && pushd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make
make install
