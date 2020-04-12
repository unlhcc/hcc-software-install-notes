#!/bin/bash

module load compiler/pgi/12 szip/2.1 zlib/1.2
make clean && make distclean

./configure --prefix=/util/opt/hdf4/4.2/pgi/12 --with-szlib=/util/opt/szip/2.1/pgi/12 --with-zlib=/util/opt/zlib/1.2/pgi/12
