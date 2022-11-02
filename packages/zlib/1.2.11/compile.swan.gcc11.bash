#!/bin/bash

module purge
module load compiler/gcc/11

make clean && make distclean

PREFIX=/util/opt/zlib/1.2.11/gcc/11
./configure --prefix=$PREFIX
make && make install
