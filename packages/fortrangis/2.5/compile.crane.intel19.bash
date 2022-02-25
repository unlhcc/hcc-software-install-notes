#!/bin/bash

module purge
module load compiler/intel/19 gdal/3.4 proj/7.1 shapelib/1.5 openjpeg/2.4 #readosm/1.1
export FCFLAGS="$FCFLAGS -I../libfortranc"
export EGREP=grep
export LDFLAGS="-Wl,--rpath=$OPENJPEG/lib $LDFLAGS"

PREFIX=/util/opt/fortrangis/2.5/intel/19.0.8
make clean && make distclean
./configure --prefix=$PREFIX --enable-gdal --enable-proj --enable-shapelib --disable-readosm --disable-doxydoc
# their makefile doesn't do the dependencies properly so force this first
make -C libfortranc
make -C libfortrangis shapelib.o
make
make install
