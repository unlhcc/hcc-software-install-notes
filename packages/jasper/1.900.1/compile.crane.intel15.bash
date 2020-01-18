#!/bin/bash

module load compiler/intel/15

make clean
make distclean

CXXFLAGS="$CXXFLAGS -fPIC" 
FFLAGS="-fPIC $FFLAGS" 
CFLAGS="-fPIC $CFLAGS"    

./configure --prefix=/util/opt/jasper/1.900.1/intel/15.0.2 --with-pic --enable-shared
