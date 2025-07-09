#!/bin/bash

module purge
module load compiler/intel/20

PREFIX=/util/opt/spglib/2.0.2/intel/20

rm -rf build && mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib ..
make
make install
