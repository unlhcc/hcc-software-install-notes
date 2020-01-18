#!/bin/bash

module load compiler/pgi/12

make clean
make distclean

./configure --prefix=/util/opt/jasper/1.900.1/pgi/12
