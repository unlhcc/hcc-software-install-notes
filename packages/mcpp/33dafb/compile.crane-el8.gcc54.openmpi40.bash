#!/bin/bash

module purge
module load compiler/gcc/5.4 openmpi/4.0 alps/2.3 armadillo/10.3 fftw3/3.3 intel-mkl/18 cmake/3.17

PREFIX=/util/opt/mcpp/d33dafb/openmpi/4.0.2/gcc/5.4.0
export CXXFLAGS="$CXXFLAGS -std=c++11"

rm -rf build && mkdir build && pushd build

# ALPS_ROOT set by alps module

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DCMAKE_PREFIX_PATH=/util/opt/armadillo/10.3/gcc/5.4 \
 -DUSE_MPI=ON \
 -DUSE_ARMADILLO=ON \
..

make VERBOSE=1
