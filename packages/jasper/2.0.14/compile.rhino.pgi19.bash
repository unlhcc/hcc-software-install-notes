#!/bin/bash

module purge
module use /util/opt/hcc-modules/Common
module load compiler/pgi/19 cmake
rm -rf build.pgi19 && mkdir -p build.pgi19
pushd build.pgi19
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/pgi/19.5  -DJAS_ENABLE_OPENGL=OFF  ..
make
make install
popd
