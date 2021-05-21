#!/bin/bash

module purge
module load compiler/intel/20

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/intel/19.1.3
make && make install
