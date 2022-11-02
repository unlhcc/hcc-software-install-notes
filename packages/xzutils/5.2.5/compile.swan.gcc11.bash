#!/bin/bash

module purge
module load compiler/gcc/11

PREFIX=/util/opt/xzutils/5.2.5/gcc/11
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
