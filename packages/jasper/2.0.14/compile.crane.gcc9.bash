#!/bin/bash

module purge
module load compiler/gcc/9 cmake
rm -rf build.gcc9 && mkdir -p build.gcc9
pushd build.gcc9
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/gcc/9  -DJAS_ENABLE_OPENGL=OFF -DJAS_ENABLE_DOC=OFF ..
make
make install
popd
