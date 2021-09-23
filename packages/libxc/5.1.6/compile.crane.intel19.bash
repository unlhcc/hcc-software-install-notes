#!/bin/bash

module purge
module load compiler/intel/19

make clean
make distclean
PREFIX=/util/opt/libxc/5.1.6/intel/19.0.8
./configure --prefix=$PREFIX --enable-shared
make -j 4
make install
