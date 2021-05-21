#!/bin/bash

module purge
module load compiler/gcc/10.2 zlib/1.2

make clean && make distclean
PREFIX=/util/opt/curl/7.76.1/gcc/10.2.0
export LDFLAGS="$LDFLAGS -Wl,-rpath /util/opt/zlib/1.2/gcc/10.2/lib/"
./configure --prefix=$PREFIX --with-libssh
make
make install
