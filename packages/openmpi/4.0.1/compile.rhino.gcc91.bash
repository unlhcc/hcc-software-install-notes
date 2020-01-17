#!/bin/bash

make clean && make distclean
module purge
module load compiler/gcc/9.1

PREFIX=/util/opt/openmpi/4.0/gcc/9.1.0
./configure     --prefix=$PREFIX \
                --with-hwloc=internal \
                --enable-mpirun-prefix-by-default \
                --with-slurm \
                --with-cma \
                --with-verbs \
                --with-pmi

#make -j 8 install
                
