#!/bin/bash

module load compiler/gcc/4.7 szip/2.1 zlib/1.2

make clean && make distclean

./configure --prefix=/util/opt/hdf4/4.2/gcc/4.7 --with-szlib=/util/opt/szip/2.1/gcc/4.7 --with-zlib=/util/opt/zlib/1.2/gcc/4.7
