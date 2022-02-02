#!/bin/bash

module purge
module load compiler/pgi/20
PREFIX=/util/opt/libbeef/0.1.3/pgi/20.4

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
