#!/bin/bash

# no modules, using system GCC
module purge
make clean && make distclean
./configure --prefix=/util/opt/hwloc/2.1.0/gcc/4.8.5 --enable-static=yes
