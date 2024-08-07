#!/bin/bash

module purge
module load compiler/intel/20

PREFIX=/util/opt/openjpeg/1.5.2/intel/19.1
./bootstrap.sh
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
ln -s ${PREFIX}/include/openjpeg-1.5/openjpeg.h ${PREFIX}/include/openjpeg.h
