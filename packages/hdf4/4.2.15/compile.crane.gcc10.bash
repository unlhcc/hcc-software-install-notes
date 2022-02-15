#!/bin/bash

# You must remove/rename the /util/opt/szip/2.1.1/gcc/19/lib/libsz.la file
# in order for the static linking to work properly.
module purge
module load compiler/gcc/10 szip/2.1 zlib/1.2 libjpeg/2.0
export LIBS="-ltirpc"
export FFLAGS="-fallow-argument-mismatch $FFLAGS"

#export CFLAGS="-Bstatic $CFLAGS"
#export FFLAGS="-Bstatic $FFLAGS"

PREFIX=/util/opt/hdf4/4.2.15/gcc/10

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
