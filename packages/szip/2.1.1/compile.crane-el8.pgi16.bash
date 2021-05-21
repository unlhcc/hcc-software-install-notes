#!/bin/bash

module load compiler/pgi/16
make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/pgi/16.10

make && make install
