#!/bin/bash

rm -rf build && mkdir build && pushd build

PREFIX=/util/opt/gromacs/2021.1/openmpi/4.0.5/gcc/10.2.0
module purge
module load compiler/gcc/10.2 fftw3/3.3 autotools cmake intel-mkl/20

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_C_COMPILER=gcc \
  -DCMAKE_CXX_COMPILER=g++ \
  -DGMX_MPI=OFF \
  -DGMX_DOUBLE=ON \
  -DGMX_BUILD_OWN_FFTW=OFF \
  -DGMX_DEFAULT_SUFFIX=OFF \
  -DGMX_BINARY_SUFFIX="" \
  -DGMX_LIBS_SUFFIX="" \
  -DGMX_GPU=OFF \
   ..

make -j 4
make install
