#!/bin/bash

rm -rf build && mkdir build && pushd build

module purge
module load compiler/gcc/4.9 openmpi/2.1 boost/1.59 pnetcdf/4.4 phdf5/1.8 matio/1.5 trilinos/12.6 perl/5.26 python/2.7 lapack/3.8 cmake

PREFIX=/util/opt/peridigm/1.5/openmpi/2.1.6/gcc/4.9.2
cmake \
 -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DCMAKE_BUILD_TYPE:STRING=Release \
 -DTrilinos_DIR:PATH=$TRILINOS/lib/cmake/Trilinos/ \
 -DCMAKE_C_COMPILER:STRING=mpicc \
 -DCMAKE_CXX_COMPILER:STRING=mpicxx \
 -DCMAKE_CXX_FLAGS:STRING="-O2 -Wall -std=c++11 -pedantic -Wno-long-long -ftrapv -Wno-deprecated" \
..

make
