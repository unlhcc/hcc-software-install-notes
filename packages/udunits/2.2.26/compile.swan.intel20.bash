#!/bin/bash

module purge
module load compiler/intel/20 expat/2.2
export PREFIX=/util/opt/udunits/2.2.26/intel/19.1
export LDFLAGS="-L${EXPAT}/lib"
export PERL=''

make clean
make distclean
./configure --prefix=$PREFIX
make
make install
