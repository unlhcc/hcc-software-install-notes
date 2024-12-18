#!/bin/bash

module purge
module load m4/1.4

mkdir ibamr-opt
cd ibamr-opt

cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/util/opt/ibamr/0.15.0/openmpi/4.0.7/gcc/10/ \
  -DBOOST_ROOT=/util/opt/boost/1.75/gcc/10.2 \
  -DPETSC_ROOT=/util/opt/petsc/3.17/openmpi/4.0.7/gcc/10 \
  -DMPI_ROOT=/util/opt/openmpi/4.0.7/gcc/10 \
  -DHYPRE_ROOT=/util/opt/petsc/3.17/openmpi/4.0.7/gcc/10 \
  -DSAMRAI_ROOT=/util/opt/samrai/2.4.4/openmpi/4.0/gcc/10/linux-g++-opt \
  -DHDF5_ROOT=/util/opt/petsc/3.17/openmpi/4.0/gcc/10 \
  -DSILO_ROOT=/util/opt/silo/4.11/openmpi/4.0/gcc/10 \
  -DLIBMESH_ROOT=/util/opt/libmesh/1.6.2/openmpi/4.0/gcc/10/1.6.2-opt \
  -DLIBMESH_METHOD=OPT \
  ../IBAMR

make -j4
make -j4 install

