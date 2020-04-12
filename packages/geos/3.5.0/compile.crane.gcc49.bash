#!/bin/bash

module load compiler/gcc/4.9
PREFIX=/util/opt/geos/3.5.0/gcc/4.9.2

make clean && make distclean
./configure --prefix=${PREFIX}
make
make check
