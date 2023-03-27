#!/bin/bash

module purge
module load compiler/intel/2021 intel-mpi/2021 intel-mkl/2021
./configure
./tools/libxc/download-libxc.csh
make ddi
make libxc
./compall
make
