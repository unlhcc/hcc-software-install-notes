#!/bin/bash

module load compiler/intel/12

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1/intel/12
