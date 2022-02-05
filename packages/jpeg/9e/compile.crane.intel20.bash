#!/bin/bash

module purge
module load compiler/intel/20

PREFIX=/util/opt/jpeg/9e/intel/19.1.3
make clean
make distclean
./configure --prefix=$PREFIX --enable-static=yes --enable-shared=yes
make
make install
