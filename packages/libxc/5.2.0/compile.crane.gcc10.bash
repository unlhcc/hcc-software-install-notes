#!/bin/bash

module purge
module load compiler/gcc/10

make clean
make distclean
PREFIX=/util/opt/libxc/5.2.0/gcc/10
./configure --prefix=$PREFIX --enable-shared --disable-fhc
make -j 4
make install
