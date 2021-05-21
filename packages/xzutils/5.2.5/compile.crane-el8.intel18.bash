#!/bin/bash

module purge
module load compiler/intel/18 autoconf/2.69

PREFIX=/util/opt/xzutils/5.2.5/intel/18.0.6
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
