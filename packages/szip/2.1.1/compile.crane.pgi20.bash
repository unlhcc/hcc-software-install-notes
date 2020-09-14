#!/bin/bash

module load compiler/pgi/20

make clean && make distclean

./configure --prefix=/util/opt/szip/2.1.1/pgi/20.4
