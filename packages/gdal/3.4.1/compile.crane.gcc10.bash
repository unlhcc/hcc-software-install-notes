#!/bin/bash

module purge
module load compiler/gcc/10 netcdf/4.7 hdf5/1.12 proj/7.1 jasper/2.0 geos/3.8 xzutils/5.2 libgeotiff/1.6
module load sqlite/3.33 libwebp/1.1 expat/2.2 libtiff/4.1 libpng/1.6 libjpeg/2.0 openjpeg/2.4 libxml2/2.9

export CXXFLAGS="${CXXFLAGS} -w -fpermissive"
export OPENJPEG_LIBS="-L$OPENJPEG/lib  -lopenjp2"
export OPENJPEG_CFLAGS="-I$OPENJPEG/include/openjpeg-2.4"
export SQLITE3_LIBS="-L$SQLITE/lib -lsqlite3"
export SQLITE3_CFLAGS="-I$SQLITE/include"
export LDFLAGS="-L$SZIP/lib -L$XZUTILS/lib"
export LIBXML2_LIBS="-L$LIBXML2/lib -lxml2"
export LIBXML2_CFLAGS="-I$LIBXML2/include/libxml2"

PREFIX=/util/opt/gdal/3.4.1/gcc/10

make clean && make distclean

./configure --prefix=$PREFIX \
--with-avx \
--with-netcdf=$NETCDF \
--with-hdf5=$HDF5 \
--with-proj=$PROJ \
--with-proj-extra-lib-for-test="-L$SQLITE/lib" \
--with-libz=$ZLIB \
--with-jasper=$JASPER \
--with-xml2=yes \
--with-sqlite3=$SQLITE \
--with-webp=$LIBWEBP \
--with-geos=$GEOS/bin/geos-config \
--with-expat=$EXPAT \
--with-libtiff=$LIBTIFF \
--with-png=$LIBPNG \
--with-openjpeg \
--with-gif \
--with-jpeg=$LIBJPEG \
--with-liblzma=yes \
--with-geotiff=$LIBGEOTIFF

make -j 4
make install
