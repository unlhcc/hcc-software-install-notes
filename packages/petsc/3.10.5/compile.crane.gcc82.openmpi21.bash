#!/bin/sh

module load compiler/gcc/8.2 openmpi/2.1 fftw3/3.3 intel-mkl/19

make clean && make distclean
unset F77 F90

./configure --prefix=/util/opt/petsc/3.10.5/openmpi/2.1/gcc/8.2.0 \
--download-hypre=1 \
--with-fftw=1 \
--with-fftw-dir="/util/opt/fftw3/3.3/openmpi/2.1/gcc/8.2" \
--with-ssl=0 \
--with-debugging=no \
--with-pic=1 \
--with-shared-libraries=1 \
--with-cc=mpicc \
--with-cxx=mpicxx \
--with-fc=mpif90 \
--with-blaslapack=1 \
--with-blaslapack-dir=$MKLROOT \
--download-hdf5=yes \
--download-metis=yes \
--download-parmetis=yes \
--download-scalapack=yes \
--with-superlu_dist=0 \
--download-mumps=yes \
--with-mumps=1 \
--with-cxx-dialect=C++11 \
CC=mpicc CXX=mpicxx FC=mpif90 F77=mpif77 F90=mpif90 \
CFLAGS='-fPIC -fopenmp' \
CXXFLAGS='-fPIC -fopenmp' \
FFLAGS='-fPIC -fopenmp' \
FCFLAGS='-fPIC -fopenmp' \
F90FLAGS='-fPIC -fopenmp' \
F77FLAGS='-fPIC -fopenmp' \
PETSC_DIR=`pwd` \
COPTFLAGS='-g -O2 -march=corei7-avx' \
CXXOPTFLAGS='-g -O2 -march=corei7-avx' \
FOPTFLAGS='-g -O2 -march=corei7-avx' \

#make PETSC_DIR=/util/src/petsc/petsc-3.10.5 PETSC_ARCH=arch-linux2-c-opt all
#make -j 4
#make install
