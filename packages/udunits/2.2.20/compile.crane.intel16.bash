#!/bin/bash

module load compiler/intel/16

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.20/intel/16.0.1
