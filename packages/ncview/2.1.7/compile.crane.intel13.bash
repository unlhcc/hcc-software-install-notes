#!/bin/bash

module load compiler/intel/13

make clean && make distclean

PREFIX=/util/opt/ncview/2.1.7/intel/13.1.3

./configure --prefix=$PREFIX --with-nc-config=/util/opt/netcdf/4.4/intel/13/bin/nc-config \
--with-udunits2_incdir=/util/opt/udunits/2.2/intel/13/include \
--with-udunits2_libdir=/util/opt/udunits/2.2/intel/13/lib

make && make install
