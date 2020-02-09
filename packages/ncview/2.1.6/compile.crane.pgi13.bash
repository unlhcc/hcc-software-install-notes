#!/bin/bash

module load compiler/pgi/13

make clean && make distclean

PREFIX=/util/opt/ncview/2.1.6/pgi/13.10

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.2/pgi/13/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.2/pgi/13/include \
--with-udunits2_libdir=/util/opt/udunits/2.2/pgi/13/lib

make && make install

