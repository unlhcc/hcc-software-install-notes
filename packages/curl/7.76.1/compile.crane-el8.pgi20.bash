#!/bin/bash

module purge
module load compiler/pgi/20 zlib/1.2

make clean && make distclean
PREFIX=/util/opt/curl/7.76.1/pgi/20.4
export LDFLAGS="$LDFLAGS -Wl,-rpath /util/opt/zlib/1.2/pgi/20/lib/"
./configure --prefix=$PREFIX --with-libssh
make -j 4
make install
