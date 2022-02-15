#!/bin/bash

module purge
module load compiler/gcc/9 cmake
PREFIX=/util/opt/libjpeg-turbo/2.0.5/gcc/9

rm -rf build.gcc9
mkdir -p build.gcc9
pushd build.gcc9


cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib ..
make
make install
