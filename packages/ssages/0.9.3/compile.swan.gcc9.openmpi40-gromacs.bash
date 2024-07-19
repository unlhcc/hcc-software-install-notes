#!/bin/bash

mkdir -p /util/opt/ssages/0.9.3-gromacs/openmpi/4.0/gcc/9/

module purge
module load compiler/gcc/9 openmpi/4.0 automake/1.16 intel-mkl/19 git/2.40 python/2.7 cmake/3.20 boost/1.66

cd /util/opt/ssages/0.9.3-gromacs/openmpi/4.0/gcc/9/
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DGROMACS="2018" \
    -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpic++ \
    -DPython_EXECUTABLE:FILEPATH=/util/opt/anaconda/deployed-conda-envs/packages/python/envs/python-2.7/bin/python \
    -DGMX_DOUBLE=ON -DGMX_BUILD_OWN_FFTW=ON -DGMX_GPU=OFF ..
make -j8

#SSAGES does not recognize cmake/make PREFIX/INSTALL directories
#SSAGES depeds on the strucutre of the hooks build directory
#The PATH is set to /util/opt/ssages/0.9.3-gromacs/openmpi/4.0/gcc/9/build in the module file
