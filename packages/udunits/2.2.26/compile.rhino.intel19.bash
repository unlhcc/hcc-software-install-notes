#!/bin/bash

module purge
module load compiler/intel/19

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.26/intel/19.0.1
make
make install
