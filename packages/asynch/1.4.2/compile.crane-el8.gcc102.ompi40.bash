#!/bin/bash

module purge
module load compiler/gcc/10.2 openmpi/4.0 hdf5/1.12 metis/5.1 petsc/3.15

export PKG_CONFIG_PATH=$PETSC_DIR/lib/pkgconfig
export METIS_CFLAGS="-I${METIS}/include" METIS_LIBS="-L${METIS}/lib -lmetis"
export CFLAGS="$CFLAGS -I${METIS}/include" LDFLAGS="$LDFLAGS -L${METIS}/lib -Wl,-rpath=/util/opt/postgresql/13.4/gcc/10.2/lib"

PREFIX=/util/opt/asynch/1.4.2/openmpi/4.0.5/gcc/10.2.0

# first time setup:
# cp /usr/share/aclocal/pkg.m4 m4 
# Add the line 'AUTOMAKE_OPTIONS = subdir-objects no-exeext' to src/Makefile.am
# change 'bin_PROGRAMS += assim' => 'bin_PROGRAMS += assimx' in src/Makefile.am
# and change 'assim' => 'assimx' in the three lines that follow
# autoreconf -ivf 

make clean && make distclean
./configure --prefix=$PREFIX --with-postgresql=/util/opt/postgresql/13.4/gcc/10.2/bin/pg_config --with-zlib=$ZLIB --with-hdf5=$HDF5/bin/h5cc
make
make install

# after install, rename 'assimx' => 'assim' in the bin/ folder
