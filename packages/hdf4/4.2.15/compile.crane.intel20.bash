#!/bin/bash

# You must remove/rename the /util/opt/szip/2.1.1/intel/20/lib/libsz.la file
# in order for the static linking to work properly.
module purge
module load compiler/intel/20 szip/2.1 zlib/1.2 libjpeg/2.0
export LIBS="-ltirpc"
export CFLAGS="-fPIC $CFLAGS"
export FFLAGS="-fPIC $FFLAGS"

PREFIX=/util/opt/hdf4/4.2.15/intel/19.1.3

make clean && make distclean
./configure --prefix=$PREFIX \
 --with-szlib=$SZIP --with-zlib=$ZLIB \
 --with-jpeg=$LIBJPEG \
 --enable-production \
 --enable-fortran \
 --disable-netcdf \
 --disable-hdf4-xdr

make
make install
