#!/bin/bash

module purge
module load compiler/gcc/10 openmpi/4.1 intel-mkl/20 fftw3/3.3 cmake/3.20 cuda/11.4 autotools/1.0 python/3.9 flex/2.6

mkdir -p /util/opt/ambertools/22/gcc/10/openmpi/4.1

rm -rf build_gpu_mpi && mkdir build_gpu_mpi && pushd build_gpu_mpi

export PREFIX=/util/opt/ambertools/22/gcc/10/openmpi/4.1

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCOMPILER=GNU \
  -DMPI=TRUE \
  -DOPENMP=TRUE \
  -DCUDA=TRUE \
  -DMPI_C_COMPILER=mpicc \
  -DMPI_CXX_COMPILER=mpic++ \
  -DCUDA_TOOLKIT_ROOT_DIR=${CUDA_HOME} \
  -DDOWNLOAD_MINICONDA=FALSE \
  -DINSTALL_TESTS=TRUE \
  ..

make -j4
make install
