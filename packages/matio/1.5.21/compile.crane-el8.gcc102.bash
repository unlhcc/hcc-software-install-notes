#!/bin/bash

module purge
module load compiler/gcc/10.2 hdf5/1.12 zlib/1.2
PREFIX=/util/opt/matio/1.5.21/gcc/10.2.0

make clean && make distclean
CFLAGS="$CFLAGS -Wl,-rpath=$ZLIB/lib -Wl,-rpath=$HDF5/lib" ./configure --prefix=$PREFIX --with-zlib=$ZLIB --with-hdf5=$HDF5
make
make install
