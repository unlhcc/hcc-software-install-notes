#!/bin/sh
module purge
module load compiler/gcc/9.1 openmpi/4.0 make cmake
make config shared=1 openmp=1 prefix=/util/opt/parmetis/4.0.3/openmpi/4.0.5/gcc/9.1.0/
make
make install
