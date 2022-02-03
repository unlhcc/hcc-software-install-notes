#!/bin/bash

module purge
module load nvhpc/21.9

rm -f makefile.include && cp makefile.include.nvhpc_ompi_mkl_omp_acc makefile.include
make veryclean
make DEPS=1 -j 4 all
