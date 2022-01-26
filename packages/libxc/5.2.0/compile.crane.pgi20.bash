#!/bin/bash

module purge
module load compiler/pgi/20

make clean
make distclean
PREFIX=/util/opt/libxc/5.2.0/pgi/20.4
./configure --prefix=$PREFIX --enable-shared --disable-fhc
make -j 4
make install
