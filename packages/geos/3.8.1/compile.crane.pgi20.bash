#!/bin/bash

module purge
module load compiler/pgi/20
PREFIX=/util/opt/geos/3.8.1/pgi/20.4

make clean && make distclean
./configure --prefix=${PREFIX}
make -j 4
make check
