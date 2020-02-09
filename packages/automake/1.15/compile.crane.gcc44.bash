#!/bin/bash

module load m4/1.4 autoconf/2.69
make clean
make distclean
./configure --prefix=/util/opt/automake/1.15/gcc/4.4.7
