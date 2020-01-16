#!/bin/bash

module purge
module load compiler/pgi/19

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.26/pgi/19.5
make
make install
