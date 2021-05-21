#!/bin/bash

rm -rf build && mkdir build && pushd build

module purge
module load compiler/intel/18 cmake make

PREFIX=/util/opt/lapack/3.9.1/intel/18.0.6
cmake -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib -DBUILD_SHARED_LIBS=ON ..
make -j 4
make install
