#!/bin/bash

module load compiler/gcc/4.9 intel-mkl/15

make clean && make distclean

PREFIX="/util/opt/jags/4.3.0/gcc/4.9.2"

LIBS="-lrt" ./configure --prefix=${PREFIX} --disable-shared --with-blas="-lmkl_gf_lp64 -lmkl_sequential -lmkl_core -lpthread"
