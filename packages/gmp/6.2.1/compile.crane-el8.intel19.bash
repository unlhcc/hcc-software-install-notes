#!/bin/bash

module purge
module load compiler/intel/19

PREFIX=/util/opt/gmp/6.2.1/intel/19.0.1

make clean && make distclean
./configure --prefix=$PREFIX --enable-cxx
make -j 4
make install
