#!/bin/bash

module purge
module load compiler/intel/18

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/intel/18.0.6
make && make install
