#!/bin/bash

module load compiler/gcc/4.9

make clean && make distclean

./configure --prefix=/util/opt/GSL/1.16/gcc/4.9.2
