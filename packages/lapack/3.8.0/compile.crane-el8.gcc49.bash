#!/bin/bash

rm -rf build && mkdir build && pushd build

module purge
module load compiler/gcc/4.9 cmake make

PREFIX=/util/opt/lapack/3.8.0/gcc/4.9.2
cmake -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib -DBUILD_SHARED_LIBS=ON -DBUILD_DEPRECATED=ON ..
make -j 4
make install
