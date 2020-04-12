#!/bin/bash

source /util/opt/lmod/lmod/init/profile

module load compiler/intel/13

./configure --prefix=/util/opt/libxc/2.2/intel/13

make
make install
