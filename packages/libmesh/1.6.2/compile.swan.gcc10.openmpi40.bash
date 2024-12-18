#!/bin/bash

module purge

module load m4/1.4
make clean && make distclean
PREFIX=/util/opt/libmesh/1.6.2/openmpi/4.0/gcc/10/1.6.2-opt
#mkdir objs-opt
#cd objs-opt

../configure \
    --prefix=$PREFIX \
    --with-methods=opt \
      PETSC_DIR=/util/opt/petsc/3.17.0/openmpi/4.0/gcc/10 \
      PETSC_ARCH=arch-linux-c-opt \
      CFLAGS="-I/util/src/petsc/petsc-3.17.0/arch-linux-c-opt/include" \
      CC=/util/opt/openmpi/4.0.7/gcc/10/bin/mpicc \
      CXX=/util/opt/openmpi/4.0.7/gcc/10/bin/mpicxx \
      FC=/util/opt/openmpi/4.0.7/gcc/10/bin/mpif90 \
      F77=/util/opt/openmpi/4.0.7/gcc/10/bin/mpif90 \
    --enable-triangle \
    --enable-exodus \
    --enable-petsc-required \
    --disable-boost \
    --disable-eigen \
    --disable-hdf5 \
    --disable-openmp \
    --disable-perflog \
    --disable-pthreads \
    --disable-tbb \
    --disable-timestamps \
    --disable-reference-counting \
    --disable-strict-lgpl \
    --disable-glibcxx-debugging \
    --disable-vtk \
    --with-thread-model=none

make -j4
make -j4 install
