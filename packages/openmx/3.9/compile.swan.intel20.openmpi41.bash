#!/bin/bash
  
module purge
module load compiler/intel/20 intel-mkl/20 openmpi/4.0 fftw3/3.3

mkdir -p /util/opt/openmx/3.9/openmpi/4.1/intel/20/

# apply patch
cd /util/opt/openmx/3.9/openmpi/4.1/intel/20/
cp ./patch3.9.9.tar.gz ./source
rm patch3.9.9.tar.gz
cd ./source
tar zxvf patch3.9.9.tar.gz
mv kpoint.in ../work/

# edit makefile, comment out the first MKLROOT, CC, FC, and LIB variables and add instead:
CC = mpicc -O3 -Dscalapack -march=haswell -mtune=icelake-server -ip -no-prec-div -qopenmp -I$(MKLROOT)/include/fftw
FC = mpif90 -O3 -march=haswell -mtune=icelake-server -ip -no-prec-div -qopenmp
LIB= -L$(MKLROOT)/lib -mkl=parallel -lmkl_scalapack_lp64 -lmkl_blacs_openmpi_lp64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -lpthread -lifcore -lmpi -lmpi_mpifh -lmpi_usempif08

make clean
make all
make install
