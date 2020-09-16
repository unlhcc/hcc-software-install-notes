#!/bin/bash

# You must remove/rename the /util/opt/szip/2.1.1/pgi/20/lib/libsz.la file
# in order for the static linking to work properly.
module purge
module load compiler/pgi/20 szip/2.1 zlib/1.2
export CFLAGS="-Bstatic $CFLAGS"
export FFLAGS="-Bstatic $FFLAGS"

make clean && make distclean
./configure --prefix=/util/opt/hdf4/4.2.15/pgi/20.4 \
 --with-szlib=/util/opt/szip/2.1.1/pgi/20 --with-zlib=/util/opt/zlib/1.2.11/pgi/20 \
 --with-jpeg=/util/opt/libjpeg-turbo/2.0/pgi/20 \
 --enable-production
make
make install
