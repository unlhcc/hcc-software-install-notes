#!/bin/sh
module purge
module load compiler/intel/20 make cmake
make config shared=1 openmp=1 prefix=/util/opt/metis/5.1.0/intel/19.1.3
make
make install
