#!/bin/bash

module load compiler/intel/12

make clean
make distclean

CXXFLAGS="$CXXFLAGS -fPIC" FFLAGS="-fPIC $FFLAGS" CFLAGS="-fPIC $CFLAGS"    ./configure --prefix=/util/opt/jasper/1.900.1/intel/12.1.6 --with-pic --enable-shared
