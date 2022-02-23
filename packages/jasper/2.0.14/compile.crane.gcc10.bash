#!/bin/bash

module purge
module load compiler/gcc/10 libjpeg/2.0 cmake
PREFIX=/util/opt/jasper/2.0.14/gcc/10
rm -rf build.gcc10 && mkdir -p build.gcc10
pushd build.gcc10
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DJAS_ENABLE_LIBJPEG=true -DJAS_ENABLE_OPENGL=OFF \
  -DJAS_ENABLE_DOC=OFF -DCMAKE_INSTALL_LIBDIR=lib .. \
  -DCMAKE_PREFIX_PATH=$LIBJPEG

make
make install
