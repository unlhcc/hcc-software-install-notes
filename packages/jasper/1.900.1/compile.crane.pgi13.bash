#!/bin/bash

module load compiler/pgi/13

make clean
make distclean

./configure --prefix=/util/opt/jasper/1.900.1/pgi/13

