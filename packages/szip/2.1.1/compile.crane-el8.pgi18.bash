#!/bin/bash

module load compiler/pgi/18
make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/pgi/18.10

make && make install
