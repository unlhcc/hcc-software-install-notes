#!/bin/bash

module load compiler/intel/18

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1/intel/18.0.1

make && make install
