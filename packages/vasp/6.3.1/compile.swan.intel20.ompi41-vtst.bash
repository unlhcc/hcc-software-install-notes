#!/bin/bash

# Download VTST Code from https://theory.cm.utexas.edu/vtsttools/download.html.
# Perform Building the VTST code into VASP and Code change in the VASP main.F file
# as explained in https://theory.cm.utexas.edu/vtsttools/installation.html.

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20 hdf5/1.12 wannier90/3.1 libbeef/0.1 libxc/5.1 dftd4/3.3

# RHS vars are provided by the various modules
export HDF5_ROOT=$HDF5
export WANNIER90_ROOT=$WANNIER90
export LIBBEEF_ROOT=$LIBBEEF
export LIBXC_ROOT=$LIBXC
export DFTD4_ROOT=$DFTD4

rm -f makefile.include && cp makefile.include.intel_ompi_mkl_omp_avx2_vtst makefile.include
make veryclean
make DEPS=1 -j 4 all
