#!/bin/bash

module purge
module load compiler/intel/19 autoconf/2.69

PREFIX=/util/opt/xzutils/5.2.5/intel/19.0.1
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
