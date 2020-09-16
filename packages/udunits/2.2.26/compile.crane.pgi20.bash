#!/bin/bash

module purge
module load compiler/pgi/20 expat/2.2
export PREFIX=/util/opt/udunits/2.2.26/pgi/20.4
export LDFLAGS="-L${EXPAT}/lib"
export PERL=''

make clean
make distclean
./configure --prefix=$PREFIX
make
make install
