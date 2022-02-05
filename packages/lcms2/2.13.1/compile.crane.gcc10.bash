#!/bin/bash

module purge
module load compiler/gcc/10 zlib/1.2 jpeg/9e libtiff/4.1

PREFIX=/util/opt/lcms2/2.13.1/gcc/10
make clean && make distclean
./configure --prefix=$PREFIX --with-fastfloat --with-jpeg=$JPEG --with-tiff=$LIBTIFF
make
make install
