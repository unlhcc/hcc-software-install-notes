#!/bin/bash

module purge
module load compiler/pgi/20 make autotools

make clean && make distclean
PREFIX=/util/opt/bzip2/1.0.8/pgi/20.4
make CC=$CC CFLAGS="-D_FILE_OFFSET_BITS=64 -O2 -g -fPIC $CFLAGS"
make -f Makefile-libbz2_so CC=$CC CFLAGS="-D_FILE_OFFSET_BITS=64 -O2 -g -fPIC $CFLAGS"
make install PREFIX=$PREFIX
cp -a libbz2.so* $PREFIX/lib
