#!/bin/bash

module purge
module load compiler/gcc/11 autoconf

PREFIX=/util/opt/libwebp/1.1.0/gcc/11
make clean
make distclean
./configure --prefix=$PREFIX
make -j 4
make install 
