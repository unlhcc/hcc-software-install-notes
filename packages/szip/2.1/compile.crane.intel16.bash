#!/bin/bash

module load compiler/intel/16

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1/intel/16.0.1

make && make install
