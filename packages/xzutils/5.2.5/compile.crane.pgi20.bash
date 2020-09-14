#!/bin/bash

module purge
module load compiler/pgi/20

PREFIX=/util/opt/xzutils/5.2.5/pgi/20.4
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
