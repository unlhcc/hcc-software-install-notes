#!/bin/bash

module purge
module load compiler/intel/20 autoconf

PREFIX=/util/opt/libwebp/1.1.0/intel/19.1.3
make clean
make distclean
./configure --prefix=$PREFIX
make -j 4
make install 
