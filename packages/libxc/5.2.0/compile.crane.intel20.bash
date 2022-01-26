#!/bin/bash

module purge
module load compiler/intel/20

make clean
make distclean
PREFIX=/util/opt/libxc/5.2.0/intel/19.1.3
./configure --prefix=$PREFIX --enable-shared --disable-fhc
make -j 4
make install
