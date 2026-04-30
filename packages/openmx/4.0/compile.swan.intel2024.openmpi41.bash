#!/bin/bash

module purge
module load compiler/intel/2024 intel-mkl/2024 fftw3/3.3 openmpi/4.1

mkdir -p /util/opt/openmx/4.0/openmpi/4.1/intel/2024/
cd /util/opt/openmx/4.0/openmpi/4.1/intel/2024/source

# edit makefile, comment out the first MKLROOT, CC, FC, and LIB variables and add instead:
CC = mpicc -O3 -march=haswell -mtune=icelake-server -fcommon -Wno-implicit-function-declaration -ipo -qopenmp -I${MKLROOT}/include -I${MKLROOT}/include/fftw
FC = mpif90 -O3 -march=haswell -mtune=icelake-server -qopenmp -ipo
LIB= -L${MKLROOT}/lib/intel64 -lmkl_scalapack_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lmkl_blacs_openmpi_lp64 -lmpi_usempif08 -lmpi_usempi_ignore_tkr -lmpi_mpifh -lifcore -liomp5 -lpthread -lfftw3 -lm -ldl

make clean
make all
make install
