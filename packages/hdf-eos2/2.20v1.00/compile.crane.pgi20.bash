#!/bin/bash

# patch configure.ac and regenerate configure only once:
# patch -p0 < configure.patch && autoreconf -ivf

module purge
module load compiler/pgi/20 szip/2.1 zlib/1.2 hdf4/4.2 libjpeg/2.0

export CC=h4cc
export CFLAGS="-fPIC -Df2cFortran $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

PREFIX=/util/opt/hdf-eos2/2.20/pgi/20.4

make clean && make distclean
./configure --enable-shared --prefix=$PREFIX --with-jpeg=${LIBJPEG} \
	--with-zlib=${ZLIB} --with-hdf4=${HDF4} --with-szlib=${SZIP} --enable-install-include
make
make check
make install
