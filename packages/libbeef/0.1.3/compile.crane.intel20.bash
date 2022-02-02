#!/bin/bash

module purge
module load compiler/intel/20
PREFIX=/util/opt/libbeef/0.1.3/intel/19.1.8

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
