#!/bin/bash

module purge
module load compiler/gcc/9.1

PREFIX=/util/opt/gmp/6.2.1/gcc/9.1.0

make clean && make distclean
./configure --prefix=$PREFIX --enable-cxx
make -j 4
make install
