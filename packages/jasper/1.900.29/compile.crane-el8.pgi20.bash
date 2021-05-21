#!/bin/bash

module purge
module load compiler/pgi/20 libjpeg/2.0
export CFLAGS="$CFLAGS -noswitcherror"
export CXXFLAGS="$CXXFLAGS -noswitcherror"
export LDFLAGS="$LDFLAGS -L$LIBJPEG/lib -Wl,-rpath=$LIBJPEG/lib"

make clean
make distclean

./configure --prefix=/util/opt/jasper/1.900.29/pgi/20.4 --disable-strict
make
make install
