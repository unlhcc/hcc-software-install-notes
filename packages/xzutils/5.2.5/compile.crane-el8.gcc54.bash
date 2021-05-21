#!/bin/bash

module purge
module load compiler/gcc/5.4 autoconf/2.69

PREFIX=/util/opt/xzutils/5.2.5/gcc/5.4.0
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
