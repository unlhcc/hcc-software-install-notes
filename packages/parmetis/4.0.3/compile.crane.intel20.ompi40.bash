#!/bin/sh
module purge
module load compiler/intel/20 openmpi/4.0 make cmake
export CFLAGS="$CFLAGS -fPIC"
make config shared=1 openmp=1 prefix=/util/opt/parmetis/4.0.3/openmpi/4.0.5/intel/19.1.3
make
make install
