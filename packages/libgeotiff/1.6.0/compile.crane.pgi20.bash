#!/bin/bash

module purge
module load compiler/pgi/20 zlib/1.2 proj/7.1 libtiff/4.1 libjpeg/2.0
export LDFLAGS="${LDFLAGS} -Wl,-rpath=$ZLIB/lib"
PREFIX=/util/opt/libgeotiff/1.6.0/pgi/20.4

make clean
make distclean
./configure --prefix=$PREFIX \
  --with-zlib=$ZLIB \
  --with-jpeg=$LIBJPEG \
  --with-libtiff=$LIBTIFF \
  --with-proj=$PROJ
make
make install
