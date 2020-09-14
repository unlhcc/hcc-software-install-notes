#!/bin/bash

module purge
module load compiler/pgi/20 libpng/1.6 zlib/1.2
make clean && make distclean

export CFLAGS="$CFLAGS -silent"
export ax_cv_c_float_words_bigendian=no
export PREFIX=/util/opt/cairo/1.16.0/pgi/20.4
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/util/opt/pixman/0.40/pgi/20/lib/pkgconfig:/util/opt/freetype/2.10/pgi/20/lib/pkgconfig"
export LDFLAGS="-L${ZLIB}/lib -Wl,-rpath -Wl,${ZLIB}/lib"

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
