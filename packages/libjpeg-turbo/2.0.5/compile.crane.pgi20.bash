#!/bin/bash

module purge
module load compiler/pgi/20 cmake
PREFIX=/util/opt/libjpeg-turbo/2.0.5/pgi/20.4

rm -rf build.pgi20
mkdir -p build.pgi20
pushd build.pgi20


cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib ..
make
