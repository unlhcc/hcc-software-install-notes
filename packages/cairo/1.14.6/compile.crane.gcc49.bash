#!/bin/sh

make clean && make distclean

#PNG
export PATH=$PATH:/util/opt/PNG/1.2/gcc/4.9/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/PNG/1.2/gcc/4.9/lib
export INCLUDE=$INCLUDE:/util/opt/PNG/1.2/gcc/4.9/include
#pkgconfig
export PATH=$PATH:/util/opt/pkg-config/0.28/gcc/4.9/bin/
#pixman
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/pixman/0.34/gcc/4.9/lib
export INCLUDE=$INCLUDE:/util/opt/pixman/0.34/gcc/4.9/include
#freetype
export PATH=$PATH:/util/opt/freetype/2.4/gcc/4.9/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/freetype/2.4/gcc/4.9/lib
export INCLUDE=$INCLUDE:/util/opt/freetype/2.4/gcc/4.9/include
export INCLUDE=$INCLUDE:/util/opt/freetype/2.4/gcc/4.9/include/freetype2/freetype/config/
#fontconfig
export PATH=$PATH:/util/opt/fontconfig/2.12/gcc/4.9/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/fontconfig/2.12/gcc/4.9/lib
export INCLUDE=$INCLUDE:/util/opt/fontconfig/2.12/gcc/4.9/include
#expat
export PATH=$PATH:/util/opt/expat/2.0/gcc/4.9/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/expat/2.0/gcc/4.9/lib
export INCLUDE=$INCLUDE:/util/opt/expat/2.0/gcc/4.9/include

module load compiler/gcc/4.9

export ax_cv_c_float_words_bigendian=no

#export CFLAGS='-noswitcherror'
#export LDFLAGS='-noswitcherror'
#export CPPFLAGS='-noswitcherror'
#export CXXFLAGS='-noswitcherror'

#vim ./util/cairo-gobject/Makefile
#Remove -pthread from FLAGS

./configure --disable-atomic --prefix=/util/opt/cairo/1.14.6/gcc/4.9.2
#--disable-atomic: http://patchwork.openembedded.org/patch/1495/

make -j 4
