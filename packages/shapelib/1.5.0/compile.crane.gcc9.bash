#!/bin/bash

module purge
module load compiler/gcc/9

PREFIX=/util/opt/shapelib/1.5.0/gcc/9
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
