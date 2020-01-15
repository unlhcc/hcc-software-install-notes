#!/bin/bash

module load compiler/pgi/14
make clean && make distclean
./configure --prefix=/util/opt/zlib/1.2/pgi/14
make
make install
