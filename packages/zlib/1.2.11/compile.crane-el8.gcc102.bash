#!/bin/bash

module purge
module load compiler/gcc/10.2

make clean && make distclean

PREFIX=/util/opt/zlib/1.2.11/gcc/10.2.0
./configure --prefix=$PREFIX
make && make install
