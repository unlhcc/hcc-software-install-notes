#!/bin/bash

module purge
module load compiler/pgi/20 autoconf

PREFIX=/util/opt/libwebp/1.1.0/pgi/20.4
make clean
make distclean
./configure --prefix=$PREFIX
make -j 4
make install 
