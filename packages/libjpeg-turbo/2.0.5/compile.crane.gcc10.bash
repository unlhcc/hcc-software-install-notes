#!/bin/bash

module purge
module load compiler/gcc/10 cmake
PREFIX=/util/opt/libjpeg-turbo/2.0.5/gcc/10

rm -rf build.gcc10
mkdir -p build.gcc10
pushd build.gcc10


cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib ..
make
make install
