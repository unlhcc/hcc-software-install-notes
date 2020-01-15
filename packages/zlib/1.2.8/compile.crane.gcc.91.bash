#!/bin/bash

module load compiler/gcc/9.1
make clean && make distclean
./configure --prefix=/util/opt/zlib/1.2/gcc/9.1.0

