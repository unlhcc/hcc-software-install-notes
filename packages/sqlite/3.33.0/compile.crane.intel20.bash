#!/bin/bash

module purge
module load compiler/intel/20 zlib/1.2

PREFIX=/util/opt/sqlite/3.33.0/intel/19.1.3
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
