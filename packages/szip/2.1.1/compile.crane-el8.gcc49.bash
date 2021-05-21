#!/bin/bash

module purge
module load compiler/gcc/4.9

make clean && make distclean

PREFIX=/util/opt/szip/2.1.1/gcc/4.9.2
./configure --prefix=$PREFIX
make && make install
