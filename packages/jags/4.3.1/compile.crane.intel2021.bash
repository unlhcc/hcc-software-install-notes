#!/bin/bash

module purge
module load compiler/intel/2021 intel-mkl/2021

make clean && make distclean
PREFIX="/util/opt/jags/4.3.1/intel/2021"
export CFLAGS="-fPIC $CFLAGS" 
export CXXFLAGS="-fPIC $CXXFLAGS"
export LIBS='-lrt'
./configure --prefix=${PREFIX} --enable-shared --with-blas="-lmkl_rt -liomp5 -lpthread"
make -j 4
make install
