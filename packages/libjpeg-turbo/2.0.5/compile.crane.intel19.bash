#!/bin/bash

module purge
module load compiler/intel/19 cmake
PREFIX=/util/opt/libjpeg-turbo/2.0.5/intel/19.0.8

rm -rf build.intel19
mkdir -p build.intel19
pushd build.intel19


cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib ..
make
make install
