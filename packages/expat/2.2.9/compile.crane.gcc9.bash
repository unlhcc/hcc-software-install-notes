#!/bin/bash

module purge
module load compiler/gcc/9
PREFIX=/util/opt/expat/2.2.9/gcc/9

make clean && make distclean
./configure --prefix=${PREFIX}
make
make install
