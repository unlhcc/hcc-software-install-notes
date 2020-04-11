#!/bin/bash

rm -rf build_mpi/ && mkdir build_mpi && pushd build_mpi

PREFIX=/util/opt/gromacs/2020.1/openmpi/4.0.1/gcc/9.1.0
module purge
module load compiler/gcc/9.1 openmpi/4.0 fftw3/3.3 cmake/3.14 automake/1.16 intel-mkl/19

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_C_COMPILER=mpicc \
  -DCMAKE_CXX_COMPILER=mpic++ \
  -DGMX_MPI=ON \
  -DGMX_DOUBLE=ON \
  -DGMX_BUILD_OWN_FFTW=OFF \
  -DGMX_DEFAULT_SUFFIX=OFF \
  -DGMX_BINARY_SUFFIX="" \
  -DGMX_LIBS_SUFFIX="" \
  -DGMX_BUILD_MDRUN_ONLY=on \
  -DGMX_GPU=OFF \
   ..

make -j 4
make install
