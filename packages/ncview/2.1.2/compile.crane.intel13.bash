#!/bin/bash

module load compiler/intel/13

PREFIX=/util/opt/ncview/2.1/intel/13.1.3

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.2/intel/13/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.1/intel/13/include \
--with-udunits2_libdir=/util/opt/udunits/2.1/intel/13/lib

