#!/bin/bash
module purge

module load compiler/nvhpc/21.9 openmpi/3.1 cmake/3.20

export PREFIX=/util/opt/espresso-gpu/7.1/nvhpc/21.9/openmpi/3.1/

cd /util/src/espresso/q-e-qe-7.1
mkdir build
cd build

cmake -DCMAKE_C_COMPILER=mpicc -DCMAKE_Fortran_COMPILER=mpif90 \
-DCMAKE_INSTALL_PREFIX=${PREFIX} \
-DCMAKE_C_FLAGS="-march=corei7-avx" \
-DCMAKE_Fortran_FLAGS="-march=corei7-avx" \
-DQE_FFTW_VENDOR="Internal" \
-DQE_ENABLE_CUDA=ON \
-DQE_ENABLE_MPI=ON \
-DQE_ENABLE_OPENMP=ON ..

make PREFIX=${PREFIX} -j4
make PREFIX=${PREFIX} install 
