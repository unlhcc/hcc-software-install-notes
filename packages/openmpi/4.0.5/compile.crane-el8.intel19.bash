#!/bin/bash

make clean && make distclean
module purge
module load compiler/intel/19

PREFIX=/util/opt/openmpi/4.0.5/intel/19.0.1
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
