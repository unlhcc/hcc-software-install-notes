#!/bin/bash

module purge
module load compiler/intel/19

PREFIX=/util/opt/jpeg/9e/intel/19.0.8
make clean
make distclean
./configure --prefix=$PREFIX --enable-static=yes --enable-shared=yes
make
make install
