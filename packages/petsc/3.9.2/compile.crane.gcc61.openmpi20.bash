#!/bin/sh

module load compiler/gcc/6.1 openmpi/2.0 fftw3/3.3

./configure --prefix=/util/opt/petsc/3.9/openmpi/2.0/gcc/6.1 \
--download-hypre=1 \
--with-fftw=1 \
--with-fftw-dir="/util/opt/fftw3/3.3/openmpi/2.0/gcc/6.1" \
--with-fftw-pkg-config="/util/opt/fftw3/3.3/openmpi/2.0/gcc/6.1/lib/pkgconfig" \
--with-ssl=0 \
--with-debugging=no \
--with-pic=1 \
--with-shared-libraries=1 \
--with-cc=mpicc \
--with-cxx=mpicxx \
--with-fc=mpif90 \
--download-fblaslapack=yes \
--download-metis=yes \
--download-parmetis=yes \
--download-superlu_dist=yes \
--download-scalapack=yes \
--download-mumps=yes \
--with-mumps=1 \
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
