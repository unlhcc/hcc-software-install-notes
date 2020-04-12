#!/bin/bash
# Compile script for HMMER 3.1b1.
#
# Last updated 27/1/2015 by JJMR

module load compiler/gcc/4.8
module load openmpi/1.8

mkdir -p /util/opt/BCRF/hmmer/3.1b1/gcc/4.8.2
CUR=`pwd`
cd /util/opt/BCRF/hmmer
ln -s 3.1b1 3.1
cd gcc
ln -s 4.8.2 4.8
cd $CUR

make distclean
./configure --prefix=/util/opt/BCRF/hmmer/3.1b1/gcc/4.8.2 --enable-mpi
make 
make check
make install
