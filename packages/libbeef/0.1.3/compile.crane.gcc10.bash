#!/bin/bash

module purge
module load compiler/gcc/10
PREFIX=/util/opt/libbeef/0.1.3/gcc/10

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
