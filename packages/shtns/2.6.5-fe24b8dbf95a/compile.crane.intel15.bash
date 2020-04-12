#!/bin/bash

# IMPORTANT!
# You must change line 18 of Makefile.in to
# cc = $(CC) $(go) -O0
# before doing configure, as a workaround for a compiler bug.


make clean && make distclean
module load python/2.7 compiler/intel/15 fftw3/3.3
PREFIX=/util/opt/shtns/2.6.5-fe24b8dbf95a/intel/15.0.2
conda create -y -p ${PREFIX} numpy scipy matplotlib
source activate ${PREFIX}
./configure --enable-openmp --enable-simd --enable-python --prefix=${PREFIX}
make
make install
source deactivate

make clean && make distclean
./configure --enable-openmp --enable-simd --prefix=${PREFIX}
make
make install
