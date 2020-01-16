#!/bin/bash

module load compiler/pgi/15

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.20/pgi/15.5.0
