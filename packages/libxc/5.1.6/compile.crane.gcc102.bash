#!/bin/bash

module purge
module load compiler/gcc/10.2

make clean
make distclean
PREFIX=/util/opt/libxc/5.1.6/gcc/10.2.0
./configure --prefix=$PREFIX --enable-shared
make -j 4
make install
