#!/bin/bash

module load compiler/gcc/5.4

export SAGE_INSTALL_GCC=no
make clean && make distclean
./configure --prefix=/util/opt/sage/8.0/gcc/5.4.0
