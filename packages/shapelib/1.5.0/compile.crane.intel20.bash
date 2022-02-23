#!/bin/bash

module purge
module load compiler/intel/20

PREFIX=/util/opt/shapelib/1.5.0/intel/19.1.3
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
