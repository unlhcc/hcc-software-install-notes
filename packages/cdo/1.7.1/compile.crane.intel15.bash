#!/bin/bash

module load compiler/intel/15 netcdf/4.4 hdf5/1.8 szip/2.1

make clean && make distclean

./configure --prefix=/util/opt/cdo/1.7.1/intel/15.0.2 --with-netcdf=/util/opt/netcdf/4.4/intel/15 --with-jasper=/util/opt/jasper/1.900.1/intel/15 --with-hdf5=/util/opt/hdf5/1.8/intel/15 --with-szlib=/util/opt/szip/2.1/intel/15 --with-grib_api=/util/opt/grib-api/1.14/intel/15
