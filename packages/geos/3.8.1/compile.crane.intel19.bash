#!/bin/bash

module purge
module load compiler/intel/19
PREFIX=/util/opt/geos/3.8.1/intel/19.0.8

make clean && make distclean
./configure --prefix=${PREFIX}
make -j 8
make install
