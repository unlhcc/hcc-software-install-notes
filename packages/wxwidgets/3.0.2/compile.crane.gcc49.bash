#!/bin/bash

module load compiler/gcc/4.9 zlib/1.2
export PKG_CONFIG_PATH=/util/opt/gtk+/3.0/gcc/4.9/lib/pkgconfig:/util/opt/glib/2.50/gcc/4.9/lib/pkgconfig:/util/opt/cairo/1.14/gcc/4.9/lib/pkgconfig:/util/opt/fontconfig/2.12/gcc/4.9/lib/pkgconfig:/util/opt/freetype/2.4/gcc/4.9/lib/pkgconfig:/util/opt/glib/2.50/gcc/4.9/lib/pkgconfig:/util/opt/harfbuzz/1.3/gcc/4.9/lib/pkgconfig:/util/opt/pixman/0.34/gcc/4.9/lib/pkgconfig:/util/opt/PNG/1.2/gcc/4.9/lib/pkgconfig:/util/opt/pango/1.40/gcc/4.9/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/util/opt/cairo/1.14/gcc/4.9/lib:/util/opt/fontconfig/2.12/gcc/4.9/lib:/util/opt/freetype/2.4/gcc/4.9/lib:/util/opt/glib/2.50/gcc/4.9/lib:/util/opt/harfbuzz/1.3/gcc/4.9/lib:/util/opt/expat/2.0/gcc/4.9/lib:/util/opt/pixman/0.34/gcc/4.9/lib:/util/opt/PNG/1.2/gcc/4.9/lib:/util/opt/gtk+/3.0/gcc/4.9/lib:/util/opt/pango/1.40/gcc/4.9/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LD_LIBRARY_PATH

export CPATH=/util/opt/gtk+/3.0/gcc/4.9/include/gtk-3.0:/util/opt/glib/2.50/gcc/4.9/include/glib-2.0:/util/opt/glib/2.50/gcc/4.9/lib/glib-2.0/include:$CPATH
#export CPPFLAGS=-I/util/opt/gtk+/3.0/gcc/4.9/include/gtk-3.0
PREFIX=/util/opt/wxwidgets/3.0.2/gcc/4.9.2


make clean
make distclean
./configure --prefix=${PREFIX} --with-gtk-prefix=/util/opt/gtk+/3.0/gcc/4.9
make -j 4
