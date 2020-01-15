#!/bin/bash

ml purge
module load compiler/gcc/9.1

make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/gcc/9.1.0
make && make install

