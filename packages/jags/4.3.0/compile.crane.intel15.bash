#!/bin/bash

module load compiler/intel/15 intel-mkl/15

make clean && make distclean

PREFIX="/util/opt/jags/4.3.0/intel/15.0.2"
export CFLAGS="-fPIC $CFLAGS" 
export CXXFLAGS="-fPIC $CXXFLAGS"
export LIBS='-lrt'

./configure --prefix=${PREFIX} --enable-shared --with-blas="-lmkl_rt -liomp5 -lpthread"
