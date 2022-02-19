#!/bin/bash

module purge
module load compiler/intel/19

PREFIX=/util/opt/minpack/19961126/intel/19.0.8
make clean && make distclean
./configure --prefix=$PREFIX
make
make install
