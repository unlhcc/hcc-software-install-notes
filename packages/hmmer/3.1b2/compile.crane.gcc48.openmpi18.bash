#!/bin/bash
# Compile script for HMMER 3.1b2.
#
# Last updated 20150504 SCANNY

module load compiler/gcc/4.8
module load openmpi/1.8

mkdir -p /util/opt/BCRF/hmmer/3.1b2/gcc/4.8.3
CUR=`pwd`
cd /util/opt/BCRF/hmmer
unlink 3.1
ln -s 3.1b2 3.1
cd 3.1b2/gcc
ln -s 4.8.3 4.8
cd $CUR

make distclean
./configure --prefix=/util/opt/BCRF/hmmer/3.1b2/gcc/4.8.3 --enable-mpi
make
make check
make install

