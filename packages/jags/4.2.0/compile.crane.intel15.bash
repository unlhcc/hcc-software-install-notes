#!/bin/bash

module load compiler/intel/15 intel-mkl/15

make clean && make distclean

PREFIX="/util/opt/jags/4.2.0/intel/15.0.2"
export CFLAGS="-fPIC $CFLAGS" 
export CXXFLAGS="-fPIC $CXXFLAGS"

./configure --prefix=${PREFIX} --enable-shared --enable-static --with-blas="-lmkl_gf_lp64 -lmkl_sequential -lmkl_core -lpthread"
