#!/bin/bash

#source /util/opt/lmod/lmod/init/profile

./configure --prefix=/util/opt/libxc/2.2/gcc/4.4

make
make install
