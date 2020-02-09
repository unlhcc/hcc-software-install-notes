#!/bin/bash

module load compiler/pgi/15

make clean && make distclean

PREFIX=/util/opt/ncview/2.1.6/pgi/15.10

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.2/pgi/15/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.2/pgi/15/include \
--with-udunits2_libdir=/util/opt/udunits/2.2/pgi/15/lib

make && make install

