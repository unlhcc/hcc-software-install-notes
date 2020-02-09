#!/bin/bash

module load compiler/gcc/4.9 openmpi/1.8

make clean && make distclean

./configure --disable-aligned-segments --disable-ibv-multirail --prefix=/util/opt/gasnet/1.24.0/gcc/4.9.2
