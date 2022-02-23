#!/bin/bash

module purge
module load compiler/gcc/10 cmake
rm -rf build.gcc10 && mkdir -p build.gcc10
pushd build.gcc10
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/gcc/10  -DJAS_ENABLE_OPENGL=OFF -DJAS_ENABLE_DOC=OFF ..
make
make install
popd
