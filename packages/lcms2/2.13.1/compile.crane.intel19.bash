#!/bin/bash

module purge
module load compiler/intel/19 zlib/1.2 jpeg/9e libtiff/4.1

PREFIX=/util/opt/lcms2/2.13.1/intel/19.0.8
make clean && make distclean
./configure --prefix=$PREFIX --with-fastfloat --with-jpeg=$JPEG --with-tiff=$LIBTIFF
make
make install
