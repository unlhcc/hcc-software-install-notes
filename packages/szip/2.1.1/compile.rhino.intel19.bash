#!/bin/bash

ml purge
module load compiler/intel/19

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/intel/19.0.1
make && make install
