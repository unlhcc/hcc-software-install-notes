#!/bin/bash

module purge
module load compiler/gcc/9 zlib/1.2 libpng/1.6 libtiff/4.1 lcms2/2.13 cmake

export CMAKE_PREFIX_PATH=$ZLIB:$LIBPNG:$LIBTIFF:$LCMS2
PREFIX=/util/opt/openjpeg/2.4.0/gcc/9
rm -rf build && mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make
make install
