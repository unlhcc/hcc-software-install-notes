#!/bin/bash

module load compiler/gcc/9.1

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1/gcc/9.1.0
