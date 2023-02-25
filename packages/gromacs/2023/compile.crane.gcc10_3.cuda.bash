#!/bin/bash

module purge 
module load compiler/gcc/10 cuda/11.4 intel-mkl/20 fftw3/3.3 cmake/3.20 autotools/1.0 python/3.9

rm -rf build_gpu && mkdir build_gpu && pushd build_gpu

export PREFIX=/util/opt/gromacs-gpu/2023/gcc/10.3/

cmake -DGMX_GPU=CUDA \
  -DCUDA_TOOLKIT_ROOT_DIR=${CUDA_HOME} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX}  \
  -DFFTWF_INCLUDE_DIR=/util/opt/fftw3/3.3/gcc/10.2/include/ \
  -DCMAKE_C_COMPILER=gcc \
  -DCMAKE_CXX_COMPILER=g++ \
  -DGMX_BUILD_OWN_FFTW=OFF \
  -DGMX_DEFAULT_SUFFIX=OFF \
  -DGMX_BINARY_SUFFIX="" \
  -DGMX_LIBS_SUFFIX="" \
  ..

make -j4
make install
