#!/bin/bash

# In the Docker container:
# yum install libtool-ltdl postgresql-devel libXau-devel libxcb-devel gettext libxcb-devel libXrender-devel libXext-devel gdk-pixbuf2-devel libXi-devel atk-devel

module load compiler/gcc/4.9 gdal/1.11 proj/4.9 fftw3/3.3
export PKG_CONFIG_PATH=/util/opt/gtk+/3.0/gcc/4.9/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/util/opt/wxwidgets/3.0/gcc/4.9/lib:/util/opt/jasper/1.900.1/gcc/4.9/lib:/util/opt/unixodbc/2.3/gcc/4.9/lib:/util/opt/cairo/1.14/gcc/4.9/lib:/util/opt/fontconfig/2.12/gcc/4.9/lib:/util/opt/freetype/2.4/gcc/4.9/lib:/util/opt/glib/2.50/gcc/4.9/lib:/util/opt/harfbuzz/1.3/gcc/4.9/lib:/util/opt/expat/2.0/gcc/4.9/lib:/util/opt/pixman/0.34/gcc/4.9/lib:/util/opt/PNG/1.2/gcc/4.9/lib:/util/opt/pango/1.40/gcc/4.9/lib:/util/opt/gtk+/3.0/gcc/4.9/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$LD_LIBRARY_PATH
export PATH=/util/opt/wxwidgets/3.0/gcc/4.9/bin:/util/opt/jasper/1.900.1/gcc/4.9/bin:/util/opt/unixodbc/2.3/gcc/4.9/bin:$PATH
export CPATH=util/opt/jasper/1.900.1/gcc/4.9/include:/util/opt/unixodbc/2.3/gcc/4.9/include:$CPATH

PREFIX=/util/opt/saga/2.1.4/gcc/4.9.2

make clean && make distclean

./configure --prefix=${PREFIX}
make -j 4
