#!/bin/bash

module load compiler/intel/13

make clean
make distclean

CXXFLAGS="$CXXFLAGS -fPIC" FFLAGS="-fPIC $FFLAGS" CFLAGS="-fPIC $CFLAGS"    ./configure --prefix=/util/opt/jasper/1.900.1/intel/13.1.3 --with-pic --enable-shared
