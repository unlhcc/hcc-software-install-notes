#!/bin/bash

module purge
module load compiler/gcc/9.1 openmpi/4.0 fftw3/3.3 cmake/3.14 automake/1.16 intel-mkl/19
export PKG_CONFIG_PATH=/util/opt/hwloc/2.1/gcc/4.8/pkconfig:${PKG_CONFIG_PATH}

PREFIX=/util/opt/gromacs/2019.4/openmpi/4.0.1/gcc/9.1.0
rm -rf build/
mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX}  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ \
      -DGMX_MPI=ON -DGMX_DOUBLE=ON -DGMX_BUILD_OWN_FFTW=OFF -DGMX_DEFAULT_SUFFIX=OFF -DGMX_BINARY_SUFFIX="" -DGMX_LIBS_SUFFIX="" \
      -DCMAKE_PREFIX_PATH=/util/opt/hwloc/2.1/gcc/4.8 ../
#make
#make install
