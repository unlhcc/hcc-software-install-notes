#!/bin/sh
module purge
module load compiler/gcc/10.2 make cmake
make config shared=1 openmp=1 prefix=/util/opt/metis/5.1.0/gcc/10.2.0
make
make install
