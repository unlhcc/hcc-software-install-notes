#!/bin/bash

module purge
module load compiler/intel/20 libjpeg/2.0 cmake
PREFIX=/util/opt/jasper/2.0.14/intel/19.1.3
rm -rf build.intel20 && mkdir -p build.intel20
pushd build.intel20
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DJAS_ENABLE_LIBJPEG=true -DJAS_ENABLE_OPENGL=OFF \
  -DJAS_ENABLE_DOC=OFF -DCMAKE_INSTALL_LIBDIR=lib .. \
  -DCMAKE_PREFIX_PATH=$LIBJPEG

make
make install
