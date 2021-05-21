#!/bin/bash

module purge
module load compiler/gcc/7.1

make clean && make distclean

PREFIX=/util/opt/zlib/1.2.11/gcc/7.1.0
./configure --prefix=$PREFIX
make && make install
