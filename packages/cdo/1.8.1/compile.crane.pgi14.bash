#!/bin/bash

module load compiler/pgi/14 netcdf/4.4 hdf5/1.8 szip/2.1

make clean && make distclean

./configure --disable-openmp --prefix=/util/opt/cdo/1.8.1/pgi/14.10 --with-netcdf=/util/opt/netcdf/4.4/pgi/14 --with-jasper=/util/opt/jasper/1.900.1/pgi/14 --with-hdf5=/util/opt/hdf5/1.8/pgi/14 --with-szlib=/util/opt/szip/2.1/pgi/14 --with-grib_api=/util/opt/grib-api/1.14/pgi/14/

make && make install
