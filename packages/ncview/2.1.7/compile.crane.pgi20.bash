#!/bin/bash

module purge
module load compiler/pgi/20 udunits2/2.2 netcdf/4.7 libpng/1.6
# configure complains if you don't use the full path to the C compiler
export CC=`which pgcc`
export LDFLAGS="-Wl,-rpath -Wl,${ZLIB}/lib -Wl,-rpath -Wl,${LIBPNG}/lib -Wl,-rpath -Wl,${HDF5}/lib -Wl,-rpath -Wl,${SZIP}/lib"
PREFIX=/util/opt/ncview/2.1.7/pgi/20.4

make clean && make distclean
./configure --prefix=$PREFIX --with-nc-config=$NETCDF/bin/nc-config \
  --with-udunits2_incdir=$UDUNITS2/include \
  --with-udunits2_libdir=$UDUNITS2/lib \
  --with-png_incdir=$LIBPNG/include \
  --with-png_libdir=$LIBPNG/lib

make
make install
