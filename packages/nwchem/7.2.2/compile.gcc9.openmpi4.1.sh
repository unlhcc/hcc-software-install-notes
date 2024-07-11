#!/bin/bash
#Load required modules or environment variables

module load compiler/gcc/9 openmpi/4.1 python/3.9

INSTALL_DIR="/util/opt/nwchem/7.2/gcc/9/openmpi/4.1/" 
mkdir -p $INSTALL_DIR

export NWCHEM_TOP=$INSTALL_DIR 
export NWCHEM_TARGET=LINUX64 
export USE_MPI=y
export USE_OPENMP=y 
export USE_64TO32=y 
export USE_NOIO=y 
export LIBMPI="-lmpi"
export BUILD_OPENBLAS=1
export BUILD_SCALAPACK=1
export BLAS_SIZE=8
export SCALAPACK_SIZE=8


cd $NWCHEM_TOP/src
make nwchem_config NWCHEM_MODULES=all

make FC=gfortran
