#!/bin/bash

module load compiler/intel/15

make clean && make distclean

PREFIX=/util/opt/ncview/2.1.7/intel/15.0.2

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.4/intel/15/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.2/intel/15/include \
--with-udunits2_libdir=/util/opt/udunits/2.2/intel/15/lib

make && make install
