#!/bin/bash

rm -rf build_gpu && mkdir -p build_gpu && pushd build_gpu

# GCC 7.1 is the highest version supported by CUDA 10.0
PREFIX=/util/opt/gromacs-gpu/2020.1/gcc/7.1.0
module purge
module load compiler/gcc/7.1 intel-mkl/19 cuda/10.0 cmake/3.14 fftw3/3.3 automake/1.16

cmake -DGMX_GPU=ON \
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
