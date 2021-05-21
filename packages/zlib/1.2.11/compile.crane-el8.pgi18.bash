#!/bin/bash

module load compiler/pgi/18
make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/pgi/18.10

make && make install
