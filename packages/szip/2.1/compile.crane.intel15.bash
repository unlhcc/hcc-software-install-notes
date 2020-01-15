#!/bin/bash

module load compiler/intel/15

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1/intel/15
