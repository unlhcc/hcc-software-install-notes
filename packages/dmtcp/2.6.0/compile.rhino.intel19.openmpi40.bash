#!/bin/bash

make clean && make distclean
module purge
module load compiler/intel/19 openmpi/4.0
./configure --prefix=/util/opt/dmtcp/2.6.0/openmpi/4.0.1/intel/19.0 --enable-forked-checkpointing
make
make install
