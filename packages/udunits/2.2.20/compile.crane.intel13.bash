#!/bin/bash

module load compiler/intel/13

make clean && make distclean

export PERL=''
./configure --prefix=/util/opt/udunits/2.2.20/intel/13.1.3
