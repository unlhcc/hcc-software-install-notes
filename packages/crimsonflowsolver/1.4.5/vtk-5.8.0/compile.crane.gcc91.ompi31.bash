#!/bin/bash

module purge
module load compiler/gcc/9.1 openmpi/3.1 cmake

PREFIX=/util/opt/crimsonflowsolver/vtk/5.8.0/openmpi/3.1.6/gcc/9.1.0
rm -rf build && mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX  \
 -DCMAKE_C_COMPILER=mpicc \
 -DCMAKE_CXX_COMPILER=mpicxx \
 -DVTK_USE_RENDERING=OFF \
 -DCMAKE_CXX_FLAGS=-Wno-error=narrowing \
 ..

make
