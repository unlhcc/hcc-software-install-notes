#!/bin/bash

module purge
module use /util/opt/hcc-modules/Common
module load compiler/gcc/9.1 cmake
rm -rf build.gcc91 && mkdir -p build.gcc91
pushd build.gcc91
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/gcc/9.1.0  -DJAS_ENABLE_OPENGL=OFF  ..
make
make install
popd
