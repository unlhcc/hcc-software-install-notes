#!/bin/bash

module load m4/1.4
make clean
make distclean
./configure --prefix=/util/opt/autoconf/2.69/gcc/4.4.7
