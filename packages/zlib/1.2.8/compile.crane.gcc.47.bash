#!/bin/bash

module load compiler/gcc/4.7
make clean && make distclean
./configure --prefix=/util/opt/zlib/1.2.8/gcc/4.7.3
