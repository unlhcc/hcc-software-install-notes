#!/bin/bash

module load compiler/gcc/4.9

PREFIX=/util/opt/harfbuzz/1.3.1/gcc/4.9.2

export PKG_CONFIG_PATH=/util/opt/cairo/1.14/gcc/4.9/lib/pkgconfig:/util/opt/fontconfig/2.12/gcc/4.9/lib/pkgconfig:/util/opt/freetype/2.4/gcc/4.9/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/util/opt/cairo/1.14/gcc/4.9/lib:/util/opt/fontconfig/2.12/gcc/4.9/lib:/util/opt/freetype/2.4/gcc/4.9/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LD_LIBRARY_PATH

make clean
make distclean
./configure --prefix=${PREFIX}
