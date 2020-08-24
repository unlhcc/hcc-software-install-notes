#!/bin/bash

module load compiler/intel/19 intel-mkl/19 openmpi/4.0
# MKL module defines MKLROOT

PREFIX=/util/opt/espresso/6.6/openmpi/4.0.1/intel/19.0.1
make clean && make distclean

./configure --prefix=${PREFIX} \

make all
make install
