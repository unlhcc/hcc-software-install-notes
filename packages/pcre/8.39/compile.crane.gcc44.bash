#!/bin/bash

module load zlib/1.2 bzip2/1.0
PREFIX=/util/opt/pcre/8.39/gcc/4.4.7
make clean
make distclean
export LDFLAGS='-L/util/opt/bzip2/1.0/gcc/4.4/lib -L/util/opt/zlib/1.2/gcc/4.4/lib -Wl,-rpath=/util/opt/bzip2/1.0/gcc/4.4/lib,-rpath=/util/opt/zlib/1.2/gcc/4.4/lib'
./configure --prefix=${PREFIX} --enable-utf --enable-pcregrep-libz --enable-pcregrep-libbz2
make V=1
