#!/bin/bash

make clean && make distclean
./configure --prefix=/util/opt/zlib/1.2.8/gcc/4.4.7
make
make install
