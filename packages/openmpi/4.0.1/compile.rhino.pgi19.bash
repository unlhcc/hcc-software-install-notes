#!/bin/bash

make clean && make distclean
module purge
module load compiler/pgi/19

PREFIX=/util/opt/openmpi/4.0/pgi/19.5
./configure     --prefix=$PREFIX \
                --with-hwloc=internal \
                --enable-mpirun-prefix-by-default \
                --with-slurm \
                --enable-mpi-cxx \
                --with-cma \
                --with-verbs \
                --with-pmi
#make -j 8 install
