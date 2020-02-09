#!/bin/bash

module load compiler/pgi/13

PREFIX=/util/opt/ncview/2.1/pgi/13

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.3/pgi/13/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.1/pgi/13/include \
--with-udunits2_libdir=/util/opt/udunits/2.1/pgi/13/lib

