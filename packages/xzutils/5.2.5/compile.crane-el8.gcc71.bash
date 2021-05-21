#!/bin/bash

module purge
module load compiler/gcc/7.1 autoconf/2.69

PREFIX=/util/opt/xzutils/5.2.5/gcc/7.1.0
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
