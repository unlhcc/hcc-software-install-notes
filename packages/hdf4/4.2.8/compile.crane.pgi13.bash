#!/bin/bash

module load compiler/pgi/13 szip/2.1 zlib/1.2
make clean && make distclean

./configure --prefix=/util/opt/hdf4/4.2/pgi/13 --with-szlib=/util/opt/szip/2.1/pgi/13 --with-zlib=/util/opt/zlib/1.2/pgi/13
