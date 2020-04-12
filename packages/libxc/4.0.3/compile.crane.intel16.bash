#!/bin/bash

source /util/opt/lmod/lmod/init/profile

module load compiler/intel/16

./configure --prefix=/util/opt/libxc/4.0/intel/16

make
make install
