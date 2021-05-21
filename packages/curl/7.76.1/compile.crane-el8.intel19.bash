#!/bin/bash

module purge
module load compiler/intel/19 zlib/1.2

make clean && make distclean
PREFIX=/util/opt/curl/7.76.1/intel/19.0.1
export LDFLAGS="$LDFLAGS -Wl,-rpath /util/opt/zlib/1.2/intel/19/lib/"
./configure --prefix=$PREFIX --with-libssh
make -j 4
make install
