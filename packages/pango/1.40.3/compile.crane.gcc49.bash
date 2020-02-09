#!/bin/bash

module load compiler/gcc/4.9 zlib/1.2

PREFIX=/util/opt/pango/1.40.3/gcc/4.9.2
export PKG_CONFIG_PATH=/util/opt/cairo/1.14/gcc/4.9/lib/pkgconfig:/util/opt/fontconfig/2.12/gcc/4.9/lib/pkgconfig:/util/opt/freetype/2.4/gcc/4.9/lib/pkgconfig:/util/opt/glib/2.50/gcc/4.9/lib/pkgconfig:/util/opt/harfbuzz/1.3/gcc/4.9/lib/pkgconfig:/util/opt/pixman/0.34/gcc/4.9/lib/pkgconfig:/util/opt/PNG/1.2/gcc/4.9/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/util/opt/cairo/1.14/gcc/4.9/lib:/util/opt/fontconfig/2.12/gcc/4.9/lib:/util/opt/freetype/2.4/gcc/4.9/lib:/util/opt/glib/2.50/gcc/4.9/lib:/util/opt/harfbuzz/1.3/gcc/4.9/lib:/util/opt/expat/2.0/gcc/4.9/lib:/util/opt/pixman/0.34/gcc/4.9/lib:/util/opt/PNG/1.2/gcc/4.9/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LD_LIBRARY_PATH
export PATH=/util/opt/cairo/1.14/gcc/4.9/bin:/util/opt/fontconfig/2.12/gcc/4.9/bin:/util/opt/freetype/2.4/gcc/4.9/bin:/util/opt/glib/2.50/gcc/4.9/bin:/util/opt/harfbuzz/1.3/gcc/4.9/bin:/util/opt/expat/2.0/gcc/4.9/bin:$PATH
export CPATH=/util/opt/cairo/1.14/gcc/4.9/include/cairo:/util/opt/fontconfig/2.12/gcc/4.9/include:/util/opt/freetype/2.4/gcc/4.9/include:/util/opt/glib/2.50/gcc/4.9/include/glib-2.0:/util/opt/harfbuzz/1.3/gcc/4.9/include:/util/opt/expat/2.0/gcc/4.9/include:/util/opt/pixman/0.34/gcc/4.9/lib/pkgconfig:/util/opt/PNG/1.2/gcc/4.9/include:$CPATH

make clean
make distclean
./configure --prefix=${PREFIX} --with-cairo
make -j 4
make install
