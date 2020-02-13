#!/bin/bash

make clean && make distclean
module purge
module load compiler/gcc/9.1

PREFIX=/util/opt/openmpi/4.0.2/gcc/9.1.0
./configure     --prefix=$PREFIX \
                --with-hwloc=internal \
                --enable-mpirun-prefix-by-default \
                --with-slurm \
                --with-cma \
                --with-verbs \
                --with-pmi \
                --with-psm \
                --with-psm2=/usr \
                --with-knem=/opt/knem-1.1.2.90mlnx1

#make -j 8 install
