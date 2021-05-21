#!/bin/bash

make clean && make distclean
module purge
module load compiler/pgi/18

# for some reason the '-tp=sandybridge' option breaks configure
unset CFLAGS CXXFLAGS FCFLAGS F90FLAGS

PREFIX=/util/opt/openmpi/4.0.5/pgi/18.10
./configure     --prefix=$PREFIX \
                --with-hwloc=internal \
                --enable-mpirun-prefix-by-default \
                --with-slurm \
                --with-cma \
                --with-verbs \
                --with-pmi \
                --with-psm \
                --with-psm2

#make -j 8 install
