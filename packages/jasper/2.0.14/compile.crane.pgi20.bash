#!/bin/bash

module purge
module use /util/opt/hcc-modules/Common
module load compiler/pgi/20 cmake
rm -rf build.pgi20 && mkdir -p build.pgi20
pushd build.pgi20
cmake -DCMAKE_INSTALL_PREFIX=/util/opt/jasper/2.0.14/pgi/20.4  -DJAS_ENABLE_OPENGL=OFF -DJAS_ENABLE_DOC=OFF ..
make
make install
popd
