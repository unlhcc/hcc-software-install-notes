#!/bin/bash

module purge
module load compiler/intel/20 cmake
PREFIX=/util/opt/libjpeg-turbo/2.0.5/intel/19.1.3

rm -rf build.intel20
mkdir -p build.intel20
pushd build.intel20


cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib ..
make
make install
