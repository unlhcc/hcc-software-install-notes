#!/bin/bash

# VASP 6.6.1 OpenACC GPU + VASPml build
# requires libatomic and nvidia-x11-drv-libs-470.103.01

module purge
module load compiler/nvhpc/24.5 intel-mkl/2024.2

# Add the OpenMPI bundled with NVHPC 24.5 to PATH.
export PATH=/util/opt/nvidia-hpc-sdk/2024.245/Linux_x86_64/24.5/comm_libs/openmpi4/bin/:$PATH

rm -f makefile.include
cp makefile.include.nvhpc_ompi_mkl_omp_acc_ml makefile.include

make veryclean
make DEPS=1 -j 4 all

# VASP recommends running the test suite after a successful build.
# make test

# Install:
mkdir -p /util/opt/vasp/6.6.1-acc-ml/nvhpc/24.5/bin/
mkdir -p /util/opt/vasp/6.6.1-acc-ml/nvhpc/24.5/lib/
cp bin/* /util/opt/vasp/6.6.1-acc-ml/nvhpc/24.5/bin/
cp ./build/std/vaspml/lib/libvaspml.a /util/opt/vasp/6.6.1-acc-ml/nvhpc/24.5/lib/

