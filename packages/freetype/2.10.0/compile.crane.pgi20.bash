#!/bin/bash

module purge
module use /util/opt/hcc-modules/Common
module load compiler/pgi/20 zlib/1.2 libpng/1.6 bzip2/1.0
export ZLIB_LIBS="-L${ZLIB}/lib -Wl,-rpath -Wl,${ZLIB}/lib -lz"
export ZLIB_CFLAGS="-I${ZLIB}/include"
export BZIP2_LIBS="-L${BZIP2}/lib -lbz2"
export BZIP2_CFLAGS="-I${BZIP2}/include"
export LIBPNG_LIBS="-L${LIBPNG}/lib -Wl,-rpath -Wl,${LIBPNG}/lib -lpng"
export LIBPNG_CFLAGS="-I${LIBPNG}/include"

#export CFLAGS="-fPIC $CFLAGS"
#export CXXFLAGS="-fPIC $CXXFLAGS"
#export FFLAGS="-fPIC $FFLAGS"
#export F90FLAGS="-fPIC $F90FLAGS"

PREFIX=/util/opt/freetype/2.10.0/pgi/20.4
sed -i  s/supports_anon_versioning\=yes/supports_anon_versioning\=no/g builds/unix/configure
make clean && make distclean
./configure --prefix=$PREFIX --with-bzip2=yes --with-zlib=yes --with-png=yes --enable-freetype-config
make
make install
