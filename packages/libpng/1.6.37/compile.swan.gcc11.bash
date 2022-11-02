#!/bin/bash

module purge
module load compiler/gcc/11 zlib/1.2
export LDFLAGS="-L${ZLIB}/lib -Wl,-rpath -Wl,${ZLIB}/lib"

PREFIX=/util/opt/libpng/1.6.37/gcc/11
make clean
make distclean
./configure --prefix=$PREFIX --with-zlib-prefix=$ZLIB
make
make install
