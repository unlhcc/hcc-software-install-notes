#!/bin/bash

module purge
module load compiler/intel/20 autoconf/2.69

PREFIX=/util/opt/xzutils/5.2.5/intel/19.1.3
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
