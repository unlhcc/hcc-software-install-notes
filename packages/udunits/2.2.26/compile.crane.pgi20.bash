#!/bin/bash

module purge
module load compiler/pgi/20

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.26/pgi/20.4
make
make install
