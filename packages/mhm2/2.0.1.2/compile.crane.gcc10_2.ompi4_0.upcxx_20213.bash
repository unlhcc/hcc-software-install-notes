#!/bin/bash

module purge
module load compiler/gcc/10.2 openmpi/4.0 upcxx/2021.3 cmake cuda/11.2
PREFIX=/util/opt/mhm2-gpu/2.0.1.2/openmpi/4.0.5/gcc/10.2.0

export MHM2_CMAKE_EXTRAS="-DCMAKE_CXX_COMPILER=`which mpicxx`"
rm -rf .build
./build.sh clean
MHM2_INSTALL_PATH=$PREFIX ./build.sh Release
