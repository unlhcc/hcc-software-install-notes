#!/bin/bash

module purge
module load compiler/gcc/10 zlib/1.2

PREFIX=/util/opt/sqlite/3.33.0/gcc/10
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
