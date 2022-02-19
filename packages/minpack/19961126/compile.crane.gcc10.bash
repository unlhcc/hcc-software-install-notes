#!/bin/bash

module purge
module load compiler/gcc/10

PREFIX=/util/opt/minpack/19961126/gcc/10
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
