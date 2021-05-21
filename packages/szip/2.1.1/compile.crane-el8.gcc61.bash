#!/bin/bash

module purge
module load compiler/gcc/6.1

make clean && make distclean

PREFIX=/util/opt/szip/2.1.1/gcc/6.1.0
./configure --prefix=$PREFIX
make && make install
