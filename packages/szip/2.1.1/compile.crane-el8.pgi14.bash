#!/bin/bash

module load compiler/pgi/14
make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/pgi/14.7

make && make install
