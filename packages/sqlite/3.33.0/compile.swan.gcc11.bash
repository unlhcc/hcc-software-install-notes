#!/bin/bash

module purge
module load compiler/gcc/11 zlib/1.2

PREFIX=/util/opt/sqlite/3.33.0/gcc/11
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
