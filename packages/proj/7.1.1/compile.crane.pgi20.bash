#!/bin/bash

module purge
module load compiler/pgi/20 zlib/1.2

export PKG_CONFIG_PATH=/util/opt/libtiff/4.1/pgi/20/lib/pkgconfig:/util/opt/sqlite/3.33/pgi/20/lib/pkgconfig
PREFIX=/util/opt/proj/7.1.1/pgi/20.4
export CXXFLAGS="$CXXFLAGS -fpermissive"
export PATH=/util/opt/sqlite/3.33/pgi/20/bin:$PATH
export SQLITE3_LIBS="-L/util/opt/sqlite/3.33/pgi/20/lib -lsqlite3"
export SQLITE3_CFLAGS="-I/util/opt/sqlite/3.33/pgi/20/include"

sed -i s/=declaration-after-statement//g configure
sed -i s/-Wdeclaration-after-statement//g configure
make clean
make distclean
./configure --prefix=$PREFIX --without-curl
make -j 4
