#!/bin/bash


# need to use the shared lib build of hdf4, so don't load the hdf4 module
# and specify the path below
module load compiler/gcc/4.9 netcdf/4.4 hdf5/1.8 szip/2.1 proj/4.9
PREFIX=/util/opt/gdal/1.11.1/gcc/4.9.2

make clean && make distclean

./configure --prefix=$PREFIX \
--with-netcdf=/util/opt/netcdf/4.4/gcc/4.9 \
--with-hdf4=/util/opt/hdf4/4.2/gcc/4.9 \
--with-hdf5=/util/opt/hdf5/1.8/gcc/4.9 \
--with-static-proj4=/util/opt/proj/4.9/gcc/4.9 \
--with-gif \
--with-jpeg

