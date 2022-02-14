#!/bin/bash

module purge
module load compiler/gcc/9
PREFIX=/util/opt/geos/3.8.1/gcc/9

make clean && make distclean
./configure --prefix=${PREFIX}
make -j 8
make install
