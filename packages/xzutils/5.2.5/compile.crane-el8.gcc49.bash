#!/bin/bash

module purge
module load compiler/gcc/4.9 autoconf/2.69

PREFIX=/util/opt/xzutils/5.2.5/gcc/4.9.2
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
