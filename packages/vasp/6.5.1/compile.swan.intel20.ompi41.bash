#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20 phdf5/1.14 wannier90/3.1 libbeef/0.1 libxc/5.1 dftd4/3.3

# RHS vars are provided by the various modules
export HDF5_ROOT=$PHDF5
export WANNIER90_ROOT=$WANNIER90
export LIBBEEF_ROOT=$LIBBEEF
export LIBXC_ROOT=$LIBXC
export DFTD4_ROOT=$DFTD4

rm -f makefile.include && cp makefile.include.intel_ompi_mkl_omp_avx2 makefile.include
make veryclean
make DEPS=1 -j 4 all

# mkdir -p /util/opt/vasp/6.5.1/intel/20/openmpi/4.1/bin/
# cp bin/* /util/opt/vasp/6.5.1/intel/20/openmpi/4.1/bin/
