#!/bin/bash

module purge
module load compiler/intel/20

make clean && make distclean
PREFIX=/util/opt/bzip2/1.0.8/intel/19.1.3
make CC=$CC CFLAGS="-D_FILE_OFFSET_BITS=64 -O2 -g -fPIC $CFLAGS"
make -f Makefile-libbz2_so CC=$CC CFLAGS="-D_FILE_OFFSET_BITS=64 -O2 -g -fPIC $CFLAGS"
make install PREFIX=$PREFIX
cp -a libbz2.so* $PREFIX/lib
