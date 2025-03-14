#!/bin/bash

module purge
module load compiler/gcc/11 openmpi/4.1 intel-mkl/20 fftw3/3.3 cmake/3.20 cuda/12.4 autotools/1.0 python/3.9 flex/2.6

mkdir -p /util/opt/ambertools/24/gcc/11/openmpi/4.1

rm -rf build_gpu_mpi && mkdir build_gpu_mpi && pushd build_gpu_mpi

export PREFIX=/util/opt/ambertools/24/gcc/11/openmpi/4.1

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

make -j 4
#make install
patchelf --set-rpath /util/comp/gcc/11/lib64:/util/opt/ambertools/24/gcc/11/openmpi/4.1//lib:/util/opt/anaconda/deployed-conda-envs/packages/cmake/envs/cmake-3.20.2/lib /util/opt/ambertools/24/gcc/11/openmpi/4.1/bin/metatwist

patchelf --set-rpath /util/comp/gcc/11/lib64:/util/opt/ambertools/24/gcc/11/openmpi/4.1//lib:/util/opt/anaconda/deployed-conda-envs/packages/cmake/envs/cmake-3.20.2/lib /util/opt/ambertools/24/gcc/11/openmpi/4.1/bin/cpptraj
patchelf --set-rpath /util/comp/gcc/11/lib64:/util/opt/ambertools/24/gcc/11/openmpi/4.1//lib:/util/opt/anaconda/deployed-conda-envs/packages/cmake/envs/cmake-3.20.2/lib /util/opt/ambertools/24/gcc/11/openmpi/4.1/bin/cpptraj.OMP
patchelf --set-rpath /util/comp/gcc/11/lib64:/util/opt/ambertools/24/gcc/11/openmpi/4.1//lib:/util/opt/anaconda/deployed-conda-envs/packages/cmake/envs/cmake-3.20.2/lib /util/opt/ambertools/24/gcc/11/openmpi/4.1/bin/cpptraj.cuda
patchelf --set-rpath /util/comp/gcc/11/lib64:/util/opt/ambertools/24/gcc/11/openmpi/4.1//lib:/util/opt/anaconda/deployed-conda-envs/packages/cmake/envs/cmake-3.20.2/lib /util/opt/ambertools/24/gcc/11/openmpi/4.1/bin/ambpdb
