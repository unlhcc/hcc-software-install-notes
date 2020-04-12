#!/bin/bash

module load compiler/pgi/15 netcdf/4.4 hdf5/1.8 szip/2.1

make clean && make distclean

./configure --disable-openmp --prefix=/util/opt/cdo/1.8.1/pgi/15.10 --with-netcdf=/util/opt/netcdf/4.4/pgi/15 --with-jasper=/util/opt/jasper/1.900.1/pgi/15 --with-hdf5=/util/opt/hdf5/1.8/pgi/15 --with-szlib=/util/opt/szip/2.1/pgi/15 --with-grib_api=/util/opt/grib-api/1.14/pgi/15/

make && make install
