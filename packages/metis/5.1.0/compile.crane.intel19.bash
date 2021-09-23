#!/bin/sh
module purge
module load compiler/intel/19 make cmake
make config shared=1 openmp=1 prefix=/util/opt/metis/5.1.0/intel/19.0.8
make
make install
