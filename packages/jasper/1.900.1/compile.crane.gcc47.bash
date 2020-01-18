#!/bin/bash

module load compiler/gcc/4.7

make clean
make distclean

CXXFLAGS="$CXXFLAGS -fPIC" FFLAGS="-fPIC $FFLAGS" CFLAGS="-fPIC $CFLAGS"    ./configure --prefix=/util/opt/jasper/1.900.1/gcc/4.7.3 --with-pic --enable-shared
