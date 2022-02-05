#!/bin/bash

module purge
module load compiler/pgi/20

PREFIX=/util/opt/jpeg/9e/pgi/20.4
make clean
make distclean
./configure --prefix=$PREFIX --enable-static=yes --enable-shared=yes
make
make install
