#!/bin/bash

module load compiler/intel/13 netcdf/4.4 hdf5/1.8 szip/2.1

make clean && make distclean

./configure --prefix=/util/opt/cdo/1.8.1/intel/13 --with-netcdf=/util/opt/netcdf/4.4/intel/13 --with-jasper=/util/opt/jasper/1.900.1/intel/13 --with-hdf5=/util/opt/hdf5/1.8/intel/13 --with-szlib=/util/opt/szip/2.1/intel/13 --with-grib_api=/util/opt/grib-api/1.12/intel/13
