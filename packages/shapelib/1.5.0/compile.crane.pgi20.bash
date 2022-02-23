#!/bin/bash

module purge
module load compiler/pgi/20

PREFIX=/util/opt/shapelib/1.5.0/pgi/20.4
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
