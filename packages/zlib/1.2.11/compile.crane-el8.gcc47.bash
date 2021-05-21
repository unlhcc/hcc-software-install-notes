#!/bin/bash

module purge
module load compiler/gcc/4.7

make clean && make distclean

PREFIX=/util/opt/zlib/1.2.11/gcc/4.7.2
./configure --prefix=$PREFIX
make && make install
