#!/bin/bash

module purge
module load compiler/pgi/20 zlib/1.2
export CFLAGS="$CFLAGS -noswitcherror"
export CXXFLAGS="$CXXFLAGS -noswitcherror"
export F90FLAGS="$F90FLAGS -noswitcherror"

PREFIX=/util/opt/libtiff/4.1.0/pgi/20.4
make clean
make distclean
./configure --prefix=$PREFIX --with-lzma-include-dir=/util/opt/xzutils/5.2/pgi/20/include \
 --with-lzma-lib-dir=/util/opt/xzutils/5.2/pgi/20/lib \
 --with-zlib-include-dir=$ZLIB/include \
 --with-zlib-lib-dir=$ZLIB/lib \
 --with-webp-include-dir=/util/opt/libwebp/1.1/pgi/20/include \
 --with-webp-lib-dir=/util/opt/libwebp/1.1/pgi/20/lib \
 --enable-rpath

make -j 4
make install
