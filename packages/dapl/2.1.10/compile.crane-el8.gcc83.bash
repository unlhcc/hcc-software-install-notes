#!/bin/bash

module purge

make clean && make distclean

./configure --prefix=/util/opt/dapl/2.1.10/gcc/8.3.1
make
make install
