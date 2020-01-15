#!/bin/bash

ml purge
module load compiler/pgi/19

make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/pgi/19.5

make && make install
