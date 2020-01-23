#!/bin/bash

make clean && make distclean
module purge
module load compiler/gcc/9.1 openmpi/4.0
./configure --prefix=/util/opt/dmtcp/2.6.0/openmpi/4.0.1/gcc/9.1.0 --enable-forked-checkpointing
make
make install
