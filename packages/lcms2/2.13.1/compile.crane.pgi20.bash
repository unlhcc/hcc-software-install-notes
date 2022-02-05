#!/bin/bash

module purge
module load compiler/pgi/20 zlib/1.2 jpeg/9e libtiff/4.1
export CFLAGS="$CFLAGS -noswitcherror"

PREFIX=/util/opt/lcms2/2.13.1/pgi/20.4
make clean && make distclean
./configure --prefix=$PREFIX --with-fastfloat --with-jpeg=$JPEG --with-tiff=$LIBTIFF
make
make install
