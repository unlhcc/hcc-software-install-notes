#!/bin/sh
module purge
module load compiler/gcc/9.1 make cmake
make config shared=1 openmp=1 prefix=/util/opt/metis/5.1.0/gcc/9.1.0
make
make install
