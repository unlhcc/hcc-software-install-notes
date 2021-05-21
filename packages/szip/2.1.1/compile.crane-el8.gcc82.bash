#!/bin/bash

module purge
module load compiler/gcc/8.2

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/gcc/8.2.0
make && make install
