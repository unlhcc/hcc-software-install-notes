#!/bin/bash

PACKAGE=NCO
PACKAGE_VERSION=4.9.9

COMPILER=intel
COMPILER_VERSION=19.1

module purge
module load compiler/intel/20 netcdf/4.7 GSL/2.6 bison

make clean && make distclean

# NETCDF variable is set via netcdf module
export NETCDF_ROOT=${NETCDF}
export NETCDF_INC=${NETCDF}/include
export NETCDF_LIB=${NETCDF}/lib
export UDUNITS2_PATH=/util/opt/udunits/2.2.26/intel/20
export ANTLR_ROOT=/util/opt/antlr/2.7/intel/20

./configure --enable-openmp --prefix=/util/opt/${PACKAGE}/${PACKAGE_VERSION}/${COMPILER}/${COMPILER_VERSION} \
  --enable-largefile --enable-ncap2 --disable-udunits --enable-udunits2 --enable-netcdf4 --enable-gsl

make
make install
