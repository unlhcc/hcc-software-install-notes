#!/bin/bash

module purge
module load compiler/gcc/11 openmpi/4.1 cuda/12.2 intel-mkl/20 fftw3/3.3 cmake/3.20 autotools/1.0 python/3.9

rm -rf build_gpu_mpi && mkdir build_gpu_mpi && pushd build_gpu_mpi

export PREFIX=/util/opt/gromacs-gpu/2024.1/openmpi/4.1.5/gcc/11.2.0/

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_C_COMPILER=mpicc \
  -DCMAKE_CXX_COMPILER=mpic++ \
  -DGMX_MPI=ON \
  -DGMX_DOUBLE=OFF \
  -DFFTWF_INCLUDE_DIR=/util/opt/fftw3/3.3/openmpi/4.1/gcc/11/include \
  -DGMX_BUILD_OWN_FFTW=OFF \
  -DGMX_DEFAULT_SUFFIX=OFF \
  -DGMX_BINARY_SUFFIX="" \
  -DGMX_LIBS_SUFFIX="" \
  -DGMX_GPU=CUDA \
  -DCUDA_TOOLKIT_ROOT_DIR=${CUDA_HOME} \
   ..

make -j4
make install
