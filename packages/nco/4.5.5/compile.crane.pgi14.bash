#!/bin/bash

PACKAGE=NCO
PACKAGE_VERSION=4.5.5

COMPILER=pgi
COMPILER_VERSION=14.7

module load compiler/pgi/14 netcdf/4.4 szip/2.1  zlib/1.2

make clean && make distclean

# NETCDF variable is set via netcdf module
export NETCDF_PATH=${NETCDF}
export NETCDF4_ROOT=${NETCDF_PATH}
export NETCDF_INC=${NETCDF_PATH}/include
export NETCDF_LIB=${NETCDF_PATH}/lib

export UDUNITS2_PATH=/util/opt/udunits/2.1/${COMPILER}/${COMPILER_VERSION}

./configure --prefix=/util/opt/${PACKAGE}/${PACKAGE_VERSION}/${COMPILER}/${COMPILER_VERSION} --enable-largefile --disable-ncap2 --disable-udunits --enable-udunits2 --enable-netcdf4

#make
#make install
