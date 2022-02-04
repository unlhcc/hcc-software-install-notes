#!/bin/bash

module purge
module load compiler/gcc/9 autoconf

PREFIX=/util/opt/libwebp/1.1.0/gcc/9
make clean
make distclean
./configure --prefix=$PREFIX
make -j 4
make install 
