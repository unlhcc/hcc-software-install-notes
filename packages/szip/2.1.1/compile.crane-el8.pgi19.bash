#!/bin/bash

module load compiler/pgi/19
make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/pgi/19.1.0

make && make install
