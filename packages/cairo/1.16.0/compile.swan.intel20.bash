#!/bin/bash

module purge
module load compiler/intel/20 libpng/1.6 zlib/1.2
make clean && make distclean

export PREFIX=/util/opt/cairo/1.16.0/intel/19.1
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/util/opt/pixman/0.40/intel/20/lib/pkgconfig:/util/opt/freetype/2.10/intel/20/lib/pkgconfig"
export LDFLAGS="-L${ZLIB}/lib -Wl,-rpath -Wl,${ZLIB}/lib"

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
