#!/bin/bash

module purge
module load compiler/gcc/10 zlib/1.2

PREFIX=/util/opt/libtiff/4.1.0/gcc/10
make clean
make distclean
./configure --prefix=$PREFIX --with-lzma-include-dir=/util/opt/xzutils/5.2/gcc/10/include \
 --with-lzma-lib-dir=/util/opt/xzutils/5.2/gcc/10/lib \
 --with-zlib-include-dir=$ZLIB/include \
 --with-zlib-lib-dir=$ZLIB/lib \
 --with-webp-include-dir=/util/opt/libwebp/1.1/gcc/10/include \
 --with-webp-lib-dir=/util/opt/libwebp/1.1/gcc/10/lib \
 --enable-rpath

make -j 4
make install
