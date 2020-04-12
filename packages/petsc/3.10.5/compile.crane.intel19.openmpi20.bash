#!/bin/sh

module load compiler/intel/19 intel-mkl/19 openmpi/2.0 fftw3/3.3

make clean && make distclean
unset F77 F90 CFLAGS CXXFLAGS FCFLAGS FFLAGS F90FLAGS

./configure --prefix=/util/opt/petsc/3.10.5/openmpi/2.0/intel/19.0.1 \
--download-hypre=1 \
--with-fftw=1 \
--with-fftw-dir="/util/opt/fftw3/3.3/openmpi/2.0/intel/19" \
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
PETSC_DIR=`pwd` \
COPTFLAGS='-g -O2' \
CXXOPTFLAGS='-g -O2' \
FOPTFLAGS='-g -O2'

#CFLAGS='-fPIC -fopenmp -mkl' \
#CXXFLAGS='-fPIC -fopenmp -mkl' \
#FFLAGS='-fPIC -fopenmp -mkl' \
#FCFLAGS='-fPIC -fopenmp -mkl' \
#F90FLAGS='-fPIC -fopenmp' \
#F77FLAGS='-fPIC -fopenmp' \
#PETSC_DIR=`pwd` \
#COPTFLAGS='-g -O3 -march=corei7-avx' \
#CXXOPTFLAGS='-g -O3 -march=corei7-avx' \
#FOPTFLAGS='-g -O3 -march=corei7-avx' \

make PETSC_DIR=/util/src/petsc/petsc-3.10.5 PETSC_ARCH=arch-linux2-c-opt all
#make -j 4
#make install
