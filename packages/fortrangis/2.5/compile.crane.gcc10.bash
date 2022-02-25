#!/bin/bash

module purge
module load compiler/gcc/10 gdal/3.4 proj/7.1 readosm/1.1 shapelib/1.5 openjpeg/2.4
export FCFLAGS="$FCFLAGS -I../libfortranc"
export LDFLAGS="-Wl,--rpath=$OPENJPEG/lib $LDFLAGS"
export EGREP=grep

PREFIX=/util/opt/fortrangis/2.5/gcc/10
make clean && make distclean
./configure --prefix=$PREFIX --enable-gdal --enable-proj --enable-shapelib --enable-readosm --disable-doxydoc

# their makefile doesn't do the dependencies properly so force this first
make -C libfortranc
make -C libfortrangis shapelib.o
make
make install
