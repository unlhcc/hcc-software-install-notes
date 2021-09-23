#!/bin/bash

module purge
module load compiler/gcc/10.2 zlib/1.2

PREFIX=/util/opt/postgresql/13.4/gcc/10.2.0

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
