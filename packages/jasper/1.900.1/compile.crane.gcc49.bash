#!/bin/bash

module load compiler/gcc/4.9

make clean
make distclean

CXXFLAGS="$CXXFLAGS -fPIC" FFLAGS="-fPIC $FFLAGS" CFLAGS="-fPIC $CFLAGS"    ./configure --prefix=/util/opt/jasper/1.900.1/gcc/4.9.2 --with-pic --enable-shared
