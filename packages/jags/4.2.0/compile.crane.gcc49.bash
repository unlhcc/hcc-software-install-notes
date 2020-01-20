#!/bin/bash

module load compiler/gcc/4.9 intel-mkl/15

make clean && make distclean

PREFIX="/util/opt/jags/4.2/gcc/4.9"

./configure --prefix=${PREFIX} --enable-shared --enable-static --with-blas="-lmkl_gf_lp64 -lmkl_sequential -lmkl_core -lpthread"
