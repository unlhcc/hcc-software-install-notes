#!/bin/bash

module purge
module load compiler/gcc/10

PREFIX=/util/opt/shapelib/1.5.0/gcc/10
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
