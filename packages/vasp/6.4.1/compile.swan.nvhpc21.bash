#!/bin/bash

# requires libatomic and nvidia-x11-drv-libs-470.103.01

module purge
module load compiler/nvhpc/21.9 intel-mkl/20

# Add mpif90 executable and libopen-pal.so.40 to path
export PATH=/util/opt/nvidia-hpc-sdk/2021.219/Linux_x86_64/21.9/comm_libs/openmpi4/openmpi-4.0.5/bin/:$PATH
export LD_LIBRARY_PATH=/util/opt/nvidia-hpc-sdk/2021.219/Linux_x86_64/21.9/comm_libs/openmpi4/openmpi-4.0.5/lib/:$LD_LIBRARY_PATH

# vaps 6.4.1 requires nvhpc >=22.11
# as a workaround to work with nvhpc/21.9 use https://www.vasp.at/forum/viewtopic.php?f=2&t=18929
# and modify makefile.include.nvhpc_ompi_mkl_omp_acc to include FREE = -Mfree -Mx,231,0x1

rm -f makefile.include && cp makefile.include.nvhpc_ompi_mkl_omp_acc makefile.include
make veryclean
make DEPS=1 -j 4 all

# mkdir -p /util/opt/vasp/6.4.1-acc/nvhpc/21.9/bin/
# cp bin/* /util/opt/vasp/6.4.1-acc/nvhpc/21.9/bin/
