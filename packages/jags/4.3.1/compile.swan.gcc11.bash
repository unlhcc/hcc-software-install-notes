#!/bin/bash

module purge
module load compiler/gcc/11 intel-mkl/2022

make clean && make distclean
PREFIX="/util/opt/jags/4.3.1/gcc/11"
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export LIBS='-lrt'
./configure --prefix=${PREFIX} --enable-shared --with-blas="-lmkl_gf_lp64 -lmkl_sequential -lmkl_core -lpthread"
make -j 4
make install
