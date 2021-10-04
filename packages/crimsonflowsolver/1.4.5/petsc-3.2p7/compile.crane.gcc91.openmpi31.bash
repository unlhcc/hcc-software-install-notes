#!/bin/sh

module purge
module load compiler/gcc/9.1 openmpi/3.1 fftw3/3.3 intel-mkl/19 cmake boost/1.66 python/2.7
unset CC CXX FC CFLAGS FFLAGS FCFLAGS F90FLAGS CXXFLAGS

make clean && make distclean
unset F77 F90
PREFIX=/util/opt/petsc/3.2-p7/openmpi/3.1.6/gcc/9.1.0

./configure --prefix=$PREFIX \
--download-blacs=yes \
--with-memalign=64 \
--with-64-bit-indices=0 \
--download-hypre=1 \
--with-boost=1 \
--with-boost-dir=$BOOST_DIR \
--with-zlib=1 \
--with-zlib-dir=$ZLIB \
--with-netcdf=0 \
--with-fftw=1 \
--with-fftw-dir=$FFTW3 \
--with-ssl=0 \
--with-debugging=no \
--with-pic=1 \
--with-shared-libraries=1 \
--with-cc=mpicc \
--with-cxx=mpicxx \
--with-fc=mpif90 \
--with-blas-lapack=1 \
--with-blas-lapack-dir=$MKLROOT \
--with-hdf5=0 \
--with-metis=1 \
--with-metis-include=/util/opt/metis/4.0/gcc/9.1/include \
--with-metis-lib=/util/opt/metis/4.0/gcc/9.1/lib/libmetis.a \
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
COPTFLAGS='-g -O2 -march=corei7-avx -fp-model precise' \
CXXOPTFLAGS='-g -O2 -march=corei7-avx' \
FOPTFLAGS='-g -O2 -march=corei7-av -fp-model source' \

make
make install
