#!/bin/bash

module load compiler/intel/16

make clean
make distclean

CXXFLAGS="$CXXFLAGS -fPIC" 
FFLAGS="-fPIC $FFLAGS" 
CFLAGS="-fPIC $CFLAGS"    

./configure --prefix=/util/opt/jasper/1.900.1/intel/16.0.1 --with-pic --enable-shared
