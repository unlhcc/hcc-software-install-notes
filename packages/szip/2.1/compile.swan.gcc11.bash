#!/bin/bash

module purge
module load compiler/gcc/11

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/gcc/11
make && make install
