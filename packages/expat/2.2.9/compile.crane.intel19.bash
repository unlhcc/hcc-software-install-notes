#!/bin/bash

module purge
module load compiler/intel/19
PREFIX=/util/opt/expat/2.2.9/intel/19.0.8

make clean && make distclean
./configure --prefix=${PREFIX}
make
make install
