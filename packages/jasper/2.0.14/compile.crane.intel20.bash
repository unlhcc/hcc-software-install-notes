#!/bin/bash

module purge
module load compiler/intel/20 cmake
rm -rf build.intel20 && mkdir -p build.intel20
pushd build.intel20
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/intel/19.1.3  -DJAS_ENABLE_OPENGL=OFF -DJAS_ENABLE_DOC=OFF ..
make
make install
popd
