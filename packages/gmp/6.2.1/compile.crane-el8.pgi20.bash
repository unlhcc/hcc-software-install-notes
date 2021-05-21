#!/bin/bash

module purge
module load compiler/pgi/20

PREFIX=/util/opt/gmp/6.2.1/pgi/20.4

make clean && make distclean
./configure --prefix=$PREFIX --enable-cxx
make -j 4
make install
