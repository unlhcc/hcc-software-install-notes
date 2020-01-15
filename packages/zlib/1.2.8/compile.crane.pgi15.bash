#!/bin/bash

module load compiler/pgi/15
make clean && make distclean
./configure --prefix=/util/opt/zlib/1.2/pgi/15
make
make install
