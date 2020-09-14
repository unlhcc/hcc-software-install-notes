#!/bin/bash

module load compiler/pgi/20 szip/2.1 zlib/1.2
make clean && make distclean

./configure --prefix=/util/opt/hdf4/4.2.15/pgi/20.4 \
 --with-szlib=/util/opt/szip/2.1.1/pgi/20 --with-zlib=/util/opt/zlib/1.2.11/pgi/20 \
 --enable-production

make
make install
