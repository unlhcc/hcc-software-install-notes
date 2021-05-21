#!/bin/bash

module load compiler/pgi/16
make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/pgi/16.10

make && make install
