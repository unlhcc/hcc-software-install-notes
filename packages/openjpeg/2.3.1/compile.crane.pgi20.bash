#!/bin/bash

PREFIX=/util/opt/openjpeg/2.3.1/pgi/20.4

module purge
module load compiler/pgi/20

rm -rf build.pgi20 && mkdir -p build.pgi20
pushd build.pgi20
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${PREFIX} -DBUILD_THIRDPARTY=ON ..
make
make install
