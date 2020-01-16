#!/bin/bash

module purge
module load compiler/gcc/9.1

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.26/gcc/9.1.0
make
make install
