#!/bin/bash

module load compiler/intel/15

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.20/intel/15.0.2
