#!/bin/bash

# gcc 4.4 is the default compiler on Crane
module load intel-mkl/15

make clean && make distclean

PREFIX="/util/opt/jags/4.3.0/gcc/4.4.7"
export CFLAGS="-fPIC $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS" 

LIBS="-lrt" ./configure --prefix=${PREFIX} --enable-shared --enable-static --with-blas="-Wl,--no-as-needed -lmkl_rt -lpthread -lm -ldl"
