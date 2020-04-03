#!/bin/bash

module purge
module load compiler/intel/19 intel-mkl/19 openmpi/4.0

PREFIX=/util/opt/nuwrf/v9/deps
export ESMF_DIR=/util/src/esmf/esmf-6.3.0rp1
export ESMF_OS="Linux"
export ESMF_COMM="openmpi"
export ESMF_BOPT="O"
export ESMF_COMPILER="intel"
export ESMF_ABI=64
export ESMF_INSTALL_PREFIX=$PREFIX
export ESMF_NETCDF="split"
export ESMF_NETCDF_INCLUDE=${PREFIX}/include
export ESMF_NETCDF_LIBPATH=${PREFIX}/lib
export ESMF_LAPACK="mkl"
export ESMF_LAPACK_LIBS="-mkl"
#export ESMF_SHARED_LIB_BUILD="OFF"
export ESMF_CXXCOMPILEOPTS="-mkl"
export ESMF_F90COMPILEOPTS="-mkl"

#export ESMF_LAPACK_LIBPATH=/util/comp/intel/19/mkl/lib/intel64
#make clean && make distclean
#make info
#make -j 4
make install
