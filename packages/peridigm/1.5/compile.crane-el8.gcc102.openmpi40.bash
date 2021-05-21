#!/bin/bash

rm -rf build && mkdir build && pushd build

module purge
module load compiler/gcc/10.2 openmpi/4.0 boost/1.75 pnetcdf/4.7 phdf5/1.12 matio/1.5 perl/5.26 python/3.8 intel-mkl/20 cmake trilinos/13.0
PREFIX=/util/opt/peridigm/1.5/openmpi/4.0.5/gcc/10.2.0

cmake \
 -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DCMAKE_BUILD_TYPE:STRING=Release \
 -DTrilinos_DIR:PATH=$TRILINOS/lib/cmake/Trilinos/ \
 -DCMAKE_C_COMPILER:STRING=mpicc \
 -DCMAKE_CXX_COMPILER:STRING=mpicxx \
 -DCMAKE_CXX_FLAGS:STRING="-O2 -Wall -std=c++11 -pedantic -Wno-long-long -ftrapv -Wno-deprecated" \
..

make
