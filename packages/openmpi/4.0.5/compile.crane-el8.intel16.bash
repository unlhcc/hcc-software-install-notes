#!/bin/bash

make clean && make distclean
module purge
module load compiler/intel/16

PREFIX=/util/opt/openmpi/4.0.5/intel/16.0.3
./configure     --prefix=$PREFIX \
                --with-hwloc=internal \
                --enable-mpirun-prefix-by-default \
                --with-slurm \
                --with-cma \
                --with-verbs \
                --with-pmi \
                --with-psm \
                --with-psm2=/usr

make -j 4
make install
