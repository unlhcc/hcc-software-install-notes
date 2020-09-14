#!/bin/bash

module purge
module load compiler/pgi/20 netcdf/4.7 hdf5/1.12 szip/2.1 zlib/1.2
make clean && make distclean

PREFIX=/util/opt/grib-api/1.21.0/pgi/20.4
./configure --prefix=$PREFIX --with-netcdf=${NCDIR} --with-png-support --enable-omp-packing --with-openjpeg=/util/opt/openjpeg/1.5/pgi/20
make -j 4
#make install
