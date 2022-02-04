#!/bin/bash

module purge
module load compiler/intel/20 zlib/1.2
export LDFLAGS="-L${ZLIB}/lib -Wl,-rpath -Wl,${ZLIB}/lib"

PREFIX=/util/opt/libpng/1.6.37/intel/19.1.3
make clean
make distclean
./configure --prefix=$PREFIX --with-zlib-prefix=$ZLIB
make
make install
