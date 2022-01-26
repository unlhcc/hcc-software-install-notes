#!/bin/bash

module purge
module load compiler/gcc/9.1

make clean
make distclean
PREFIX=/util/opt/libxc/5.2.0/gcc/9.1.0
./configure --prefix=$PREFIX --enable-shared --disable-fhc
make -j 4
make install
