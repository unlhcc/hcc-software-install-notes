#!/bin/bash

module purge
module load compiler/intel/20 udunits2/2.2 netcdf/4.7 libpng/1.6 expat/2.2

export LDFLAGS="-Wl,-rpath -Wl,${LIBPNG}/lib -Wl,-rpath -Wl,${NETCDF}/lib -Wl,-rpath -Wl,${UDUNITS2}/lib"
PREFIX=/util/opt/ncview/2.1.7/intel/19.1

make clean && make distclean
./configure --prefix=$PREFIX --with-nc-config=$NETCDF/bin/nc-config \
  --with-udunits2_incdir=$UDUNITS2/include \
  --with-udunits2_libdir=$UDUNITS2/lib \
  --with-png_incdir=$LIBPNG/include \
  --with-png_libdir=$LIBPNG/lib

make
make install
