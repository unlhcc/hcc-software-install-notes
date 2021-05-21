#!/bin/bash

module purge
module load compiler/gcc/4.9

make clean && make distclean

PREFIX=/util/opt/zlib/1.2.11/gcc/4.9.2
./configure --prefix=$PREFIX
make && make install
