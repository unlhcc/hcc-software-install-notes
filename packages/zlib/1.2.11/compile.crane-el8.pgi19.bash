#!/bin/bash

module load compiler/pgi/19
make clean && make distclean

./configure --prefix=/util/opt/zlib/1.2.11/pgi/19.1.0

make && make install
