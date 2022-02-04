#!/bin/bash

module purge
module load compiler/gcc/10 autoconf

PREFIX=/util/opt/libwebp/1.1.0/gcc/10
make clean
make distclean
./configure --prefix=$PREFIX
make -j 4
make install 
