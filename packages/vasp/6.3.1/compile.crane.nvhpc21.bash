#!/bin/bash

# requires libatomic and nvidia-x11-drv-libs-470.103.01-1.el8_5.elrepo.x86_64 packages
# that are already installed

module purge
module load nvhpc/21.9 intel-mkl/20

rm -f makefile.include && cp makefile.include.nvhpc_ompi_mkl_omp_acc makefile.include
make veryclean
make DEPS=1 -j 4 all
