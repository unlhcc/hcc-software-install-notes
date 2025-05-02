#!/bin/bash

# requires libatomic and nvidia-x11-drv-libs-470.103.01

module purge
module load compiler/nvhpc/24.5 intel-mkl/2022.0

# Add mpif90 executable to path
export PATH=/util/opt/nvidia-hpc-sdk/2024.245/Linux_x86_64/24.5/comm_libs/openmpi4/bin/:$PATH

rm -f makefile.include && cp makefile.include.nvhpc_ompi_mkl_omp_acc_ml makefile.include
make veryclean
make DEPS=1 -j 4 all

# mkdir -p /util/opt/vasp/6.5.1-acc-ml/nvhpc/24.5/bin/
# cp bin/* /util/opt/vasp/6.5.1-acc-ml/nvhpc/24.5/bin/
# cp ./build/std/vaspml/lib/libvaspml.a /util/opt/vasp/6.5.1-acc-ml/nvhpc/24.5/lib
