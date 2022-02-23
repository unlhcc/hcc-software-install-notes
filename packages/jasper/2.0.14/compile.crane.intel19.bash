#!/bin/bash

module purge
module load compiler/intel/19 cmake
rm -rf build.intel19 && mkdir -p build.intel19
pushd build.intel19
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/intel/19.0.8  -DJAS_ENABLE_OPENGL=OFF -DJAS_ENABLE_DOC=OFF ..
make
make install
popd
