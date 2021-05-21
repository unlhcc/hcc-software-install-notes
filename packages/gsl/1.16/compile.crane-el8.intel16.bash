#!/bin/bash

module load compiler/intel/16

make clean && make distclean

./configure --prefix=/util/opt/GSL/1.16/intel/16.0.3
make -j 4
make install
