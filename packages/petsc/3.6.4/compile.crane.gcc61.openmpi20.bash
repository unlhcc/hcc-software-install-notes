#!/bin/sh

module load compiler/gcc/6.1 openmpi/2.0

./configure --prefix=/util/opt/petsc/3.6.4/openmpi/2.0.1/gcc/6.1.0 \
--download-hypre=1 \
--with-ssl=0 \
--with-debugging=no \
--with-pic=1 \
--with-shared-libraries=1 \
--with-cc=mpicc \
--with-cxx=mpicxx \
--with-fc=mpif90 \
--download-fblaslapack=1 \
--download-metis=1 \
--download-parmetis=1 \
--download-superlu_dist=1 \
--download-scalapack=1 \
--download-mumps=1 \
CC=mpicc CXX=mpicxx FC=mpif90 F77=mpif77 F90=mpif90 \
CFLAGS='-fPIC -fopenmp' \
CXXFLAGS='-fPIC -fopenmp' \
FFLAGS='-fPIC -fopenmp' \
FCFLAGS='-fPIC -fopenmp' \
F90FLAGS='-fPIC -fopenmp' \
F77FLAGS='-fPIC -fopenmp' \
PETSC_DIR=`pwd`

make -j 4
make install
