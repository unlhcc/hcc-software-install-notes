#!/bin/bash

rm -rf build_mpi/ && mkdir build_mpi && pushd build_mpi

module purge
module load compiler/gcc/10.2 openmpi/4.0 boost/1.75 pnetcdf/4.7 phdf5/1.12 matio/1.5 perl/5.26 python/3.8 intel-mkl/20 cmake
PREFIX=/util/opt/trilinos/13.0.1/openmpi/4.0.5/gcc/10.2.0

cmake \
  -DTPL_ENABLE_MPI=ON \
  -DMPI_BASE_DIR=/util/opt/openmpi/4.0/gcc/10.2 \
  -DTrilinos_ENABLE_ALL_PACKAGES=ON \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DBUILD_SHARED_LIBS=ON \
  -DTPL_ENABLE_BoostLib=ON \
  -DTPL_ENABLE_X11=OFF \
  -DTPL_ENABLE_InfiniBand=ON \
  -DInfiniBand_INCLUDE_DIRS=/usr/include/infiniband \
  -DTPL_ENABLE_MKL=ON \
  -DBLAS_LIBRARY_DIRS:FILEPATH="${MKLROOT}/lib/intel64" \
  -DBLAS_LIBRARY_NAMES:STRING="mkl_rt"  \
  -DLAPACK_LIBRARY_DIRS:FILEPATH="${MKLROOT}/lib/intel64" \
  -DLAPACK_LIBRARY_NAMES:STRING="mkl_rt" \
  -DMKL_LIBRARY_DIRS:FILEPATH="${MKLROOT}/lib/intel64" \
  -DMKL_LIBRARY_NAMES:STRING="mkl_rt" \
  -DMKL_INCLUDE_DIRS:FILEPATH="${MKLROOT}/include" \
  -DCMAKE_PREFIX_PATH="$LAPACK;$BOOST_DIR;$PNETCDF;$PHDF5;$MATIO" \
  -DTrilinos_DUMP_PACKAGE_DEPENDENCIES=ON \
  -DTrilinos_ENABLE_SECONDARY_TESTED_CODE=ON \
..

make -j 4
make install
