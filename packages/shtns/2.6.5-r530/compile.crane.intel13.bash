#!/bin/bash

make clean && make distclean
module load python/2.7 compiler/intel/13 fftw3/3.3
PREFIX=/util/opt/shtns/2.6.5/intel/13.1.3
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
