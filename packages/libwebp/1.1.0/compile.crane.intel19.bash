#!/bin/bash

module purge
module load compiler/intel/19 autoconf

PREFIX=/util/opt/libwebp/1.1.0/intel/19.0.8
make clean
make distclean
./configure --prefix=$PREFIX
make -j 4
make install 
