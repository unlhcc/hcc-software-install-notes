#!/bin/bash

module purge
module load compiler/gcc/11 cmake
PREFIX=/util/opt/libjpeg-turbo/2.0.5/gcc/11

rm -rf build.gcc11
mkdir -p build.gcc11
pushd build.gcc11


cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib ..
make
make install
