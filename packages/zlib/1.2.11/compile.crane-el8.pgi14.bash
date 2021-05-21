#!/bin/bash

module load compiler/pgi/14
make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/pgi/14.7

make && make install
