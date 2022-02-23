#!/bin/bash

module purge
module load compiler/gcc/9 libjpeg/2.0 cmake
PREFIX=/util/opt/jasper/2.0.14/gcc/9
rm -rf build.gcc9 && mkdir -p build.gcc9
pushd build.gcc9
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DJAS_ENABLE_LIBJPEG=true -DJAS_ENABLE_OPENGL=OFF \
  -DJAS_ENABLE_DOC=OFF -DCMAKE_INSTALL_LIBDIR=lib .. \
  -DCMAKE_PREFIX_PATH=$LIBJPEG

make
make install
