#!/bin/bash

module purge
module use /util/opt/hcc-modules/Common
module load compiler/intel/19 cmake
rm -rf build.intel19 && mkdir -p build.intel19
pushd build.intel19
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/intel/19.0.1  -DJAS_ENABLE_OPENGL=OFF  ..
make
make install
popd
