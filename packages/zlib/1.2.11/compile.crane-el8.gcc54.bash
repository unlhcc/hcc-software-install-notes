#!/bin/bash

module purge
module load compiler/gcc/5.4

make clean && make distclean

PREFIX=/util/opt/zlib/1.2.11/gcc/5.4.0
./configure --prefix=$PREFIX
make && make install
