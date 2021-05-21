#!/bin/bash

make clean && make distclean
module purge
module load compiler/intel/20

# the 2020 version of the Intel suite has v19 of the compiler, and i don't know why
PREFIX=/util/opt/openmpi/4.0.5/intel/19.1.3
./configure     --prefix=$PREFIX \
                --with-hwloc=internal \
                --enable-mpirun-prefix-by-default \
                --with-slurm \
                --with-cma \
                --with-verbs \
                --with-pmi \
                --with-psm \
                --with-psm2=/usr

#make -j 8 install
