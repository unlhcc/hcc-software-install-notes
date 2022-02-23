#!/bin/bash

module purge
module load compiler/pgi/20 libjpeg/2.0 cmake
PREFIX=/util/opt/jasper/2.0.14/pgi/20.4
rm -rf build.pgi20 && mkdir -p build.pgi20
pushd build.pgi20
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DJAS_ENABLE_LIBJPEG=true -DJAS_ENABLE_OPENGL=OFF \
  -DJAS_ENABLE_DOC=OFF -DCMAKE_INSTALL_LIBDIR=lib .. \
  -DCMAKE_PREFIX_PATH=$LIBJPEG

make
make install
