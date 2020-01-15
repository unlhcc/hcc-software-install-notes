#!/bin/bash

module load compiler/gcc/4.9

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1/gcc/4.9.2
