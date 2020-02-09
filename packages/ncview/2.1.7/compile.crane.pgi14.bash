#!/bin/bash

module load compiler/pgi/14

make clean && make distclean

PREFIX=/util/opt/ncview/2.1.7/pgi/14.7

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.4/pgi/14/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.2/pgi/14/include \
--with-udunits2_libdir=/util/opt/udunits/2.2/pgi/14/lib

make && make install
