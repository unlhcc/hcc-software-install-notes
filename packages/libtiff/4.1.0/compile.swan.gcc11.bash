#!/bin/bash

module purge
module load compiler/gcc/11 zlib/1.2 xzutils/5.2 libwebp/1.1 libjpeg/2.0
#export CFLAGS="$CFLAGS -noswitcherror"
#export CXXFLAGS="$CXXFLAGS -noswitcherror"
#export F90FLAGS="$F90FLAGS -noswitcherror"

export LDFLAGS="-Wl,-rpath=$LIBJPEG/lib"
PREFIX=/util/opt/libtiff/4.1.0/gcc/11
make clean
make distclean
./configure --prefix=$PREFIX --with-lzma-include-dir=$XZUTILS/include \
 --with-lzma-lib-dir=$XZUTILS/lib \
 --with-zlib-include-dir=$ZLIB/include \
 --with-zlib-lib-dir=$ZLIB/lib \
 --with-webp-include-dir=$LIBWEBP/include \
 --with-webp-lib-dir=$LIBWEBP/lib \
 --with-jpeg12-include-dir=$LIBJPEG/include \
 --with-jpeg12-lib-dir=$LIBJPEG/lib \
 --enable-rpath

make -j 4
make install
