#!/bin/bash

module purge
module load compiler/gcc/9

PREFIX=/util/opt/minpack/19961126/gcc/9
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
