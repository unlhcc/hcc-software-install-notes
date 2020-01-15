#!/bin/bash

module load compiler/gcc/4.8
make clean && make distclean
./configure --prefix=/util/opt/zlib/1.2/gcc/4.8

