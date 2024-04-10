#!/bin/bash

mkdir -p /util/opt/ssages/0.9.3/openmpi/4.0/gcc/9
export PREFIX=/util/opt/ssages/0.9.3/openmpi/4.0/gcc/9

module purge
module load compiler/gcc/9 openmpi/4.0 automake/1.16 intel-mkl/19 git/2.40 python/2.7 cmake/3.20

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DGROMACS="2018" \
    -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpic++ \
    -DGMX_DOUBLE=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_GPU=OFF ..
make -j8

#SSAGES does not recognize cmake/make PREFIX/INSTALL directories, so the generated libraries and binaries should be manually copied to PREFIX.
cp -r hooks/gromacs/gromacs/* $PREFIX
cp ssages $PREFIX/bin/
cp libssages.so $PREFIX/lib64/
