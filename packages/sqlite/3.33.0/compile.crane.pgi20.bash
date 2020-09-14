#!/bin/bash

module purge
module load compiler/pgi/20 zlib/1.2

PREFIX=/util/opt/sqlite/3.33.0/pgi/20.4
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
