#!/bin/bash

module load compiler/pgi/13
make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/pgi/13.10

make && make install
