#!/bin/bash

module purge
module load compiler/gcc/10

PREFIX=/util/opt/jpeg/9e/gcc/10
make clean
make distclean
./configure --prefix=$PREFIX --enable-static=yes --enable-shared=yes
make
make install
