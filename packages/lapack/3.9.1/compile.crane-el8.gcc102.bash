#!/bin/bash

rm -rf build && mkdir build && pushd build

module purge
module load compiler/gcc/10.2 cmake make

PREFIX=/util/opt/lapack/3.9.1/gcc/10.2.0
cmake -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib -DBUILD_SHARED_LIBS=ON ..
make -j 4
make install
