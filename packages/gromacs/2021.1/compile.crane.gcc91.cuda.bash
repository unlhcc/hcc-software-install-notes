#!/bin/bash

rm -rf build_gpu && mkdir -p build_gpu && pushd build_gpu

# GCC 9 is the highest version supported by CUDA 11.2
PREFIX=/util/opt/gromacs-gpu/2021.1/gcc/9.1.0
module purge
module load compiler/gcc/9.1 intel-mkl/20 cuda/11.2 cmake fftw3/3.3 autotools
#export PKG_CONFIG_PATH=/util/opt/hwloc/2.1/gcc/4.8/pkconfig:${PKG_CONFIG_PATH}

cmake -DGMX_GPU=CUDA \
  -DCUDA_TOOLKIT_ROOT_DIR=${CUDA_HOME} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX}  \
  -DCMAKE_C_COMPILER=gcc \
  -DCMAKE_CXX_COMPILER=g++ \
  -DGMX_BUILD_OWN_FFTW=OFF \
  -DGMX_DEFAULT_SUFFIX=OFF \
  -DGMX_BINARY_SUFFIX="" \
  -DGMX_LIBS_SUFFIX="" ..

make -j 4
make install
