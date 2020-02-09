#!/bin/bash

module load compiler/intel/16

make clean && make distclean

PREFIX=/util/opt/ncview/2.1.7/intel/16.0.3

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.4/intel/16/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.2/intel/16/include \
--with-udunits2_libdir=/util/opt/udunits/2.2/intel/16/lib

make && make install
