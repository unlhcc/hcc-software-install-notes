#!/bin/bash

module load m4/1.4 autoconf/2.69
make clean
make distclean
./configure --prefix=/util/opt/automake/1.14.1/gcc/4.4.7
