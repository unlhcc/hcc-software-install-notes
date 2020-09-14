#!/bin/bash

ml purge
module load compiler/pgi/20

make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/pgi/20.4

make && make install
