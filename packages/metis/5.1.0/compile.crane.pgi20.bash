#!/bin/sh
module purge
module load compiler/pgi/20 make cmake
make config shared=1 openmp=1 prefix=/util/opt/metis/5.1.0/pgi/20.4
make
make install
