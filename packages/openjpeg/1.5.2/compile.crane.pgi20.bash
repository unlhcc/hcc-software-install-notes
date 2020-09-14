#!/bin/bash

module purge
module load compiler/pgi/20

PREFIX=/util/opt/openjpeg/1.5.2/pgi/20.4
./bootstrap.sh
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
ln -s ${PREFIX}/include/openjpeg-1.5/openjpeg.h ${PREFIX}/include/openjpeg.h
