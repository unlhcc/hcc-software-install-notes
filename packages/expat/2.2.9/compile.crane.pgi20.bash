#!/bin/bash

module purge
module load compiler/pgi/20
PREFIX=/util/opt/expat/2.2.9/pgi/20.4

make clean && make distclean
./configure --prefix=${PREFIX}
make
make install
