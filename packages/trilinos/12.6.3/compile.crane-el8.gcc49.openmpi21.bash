#!/bin/bash

rm -rf build_mpi2 && mkdir build_mpi2 && pushd build_mpi2

module purge
module load compiler/gcc/4.9 openmpi/2.1 boost/1.59 pnetcdf/4.4 phdf5/1.8 matio/1.5 perl/5.26 python/2.7 lapack/3.8 cmake
PREFIX=/util/opt/trilinos/12.6.3/openmpi/2.1.6/gcc/4.9.2

cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
-D MPI_BASE_DIR:PATH="/util/opt/openmpi/2.1/gcc/4.9" \
-D CMAKE_CXX_FLAGS:STRING="-O2 -std=c++11 -pedantic -ftrapv -Wall -Wno-long-long" \
-D CMAKE_BUILD_TYPE:STRING=RELEASE \
-D Trilinos_WARNINGS_AS_ERRORS_FLAGS:STRING="" \
-D Trilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
-D Trilinos_ENABLE_Teuchos:BOOL=ON \
-D Trilinos_ENABLE_Shards:BOOL=ON \
-D Trilinos_ENABLE_Sacado:BOOL=ON \
-D Trilinos_ENABLE_Epetra:BOOL=ON \
-D Trilinos_ENABLE_EpetraExt:BOOL=ON \
-D Trilinos_ENABLE_Ifpack:BOOL=ON \
-D Trilinos_ENABLE_AztecOO:BOOL=ON \
-D Trilinos_ENABLE_Amesos:BOOL=ON \
-D Trilinos_ENABLE_Anasazi:BOOL=ON \
-D Trilinos_ENABLE_Belos:BOOL=ON \
-D Trilinos_ENABLE_ML:BOOL=ON \
-D Trilinos_ENABLE_Phalanx:BOOL=ON \
-D Trilinos_ENABLE_Intrepid:BOOL=ON \
-D Trilinos_ENABLE_NOX:BOOL=ON \
-D Trilinos_ENABLE_Stratimikos:BOOL=ON \
-D Trilinos_ENABLE_Thyra:BOOL=ON \
-D Trilinos_ENABLE_Rythmos:BOOL=ON \
-D Trilinos_ENABLE_MOOCHO:BOOL=ON \
-D Trilinos_ENABLE_TriKota:BOOL=OFF \
-D Trilinos_ENABLE_Stokhos:BOOL=ON \
-D Trilinos_ENABLE_Zoltan:BOOL=ON \
-D Trilinos_ENABLE_Piro:BOOL=ON \
-D Trilinos_ENABLE_Teko:BOOL=ON \
-D Trilinos_ENABLE_SEACASIoss:BOOL=ON \
-D Trilinos_ENABLE_SEACAS:BOOL=ON \
-D Trilinos_ENABLE_SEACASBlot:BOOL=ON \
-D Trilinos_ENABLE_Pamgen:BOOL=ON \
-D Trilinos_ENABLE_EXAMPLES:BOOL=OFF \
-D Trilinos_ENABLE_TESTS:BOOL=ON \
-D TPL_ENABLE_HDF5:BOOL=ON \
-D TPL_ENABLE_Netcdf:BOOL=ON \
-D TPL_Netcdf_Enables_Netcdf4:BOOL=ON \
-D TPL_ENABLE_MPI:BOOL=ON \
-D TPL_ENABLE_BLAS:BOOL=ON \
-D TPL_ENABLE_LAPACK:BOOL=ON \
-D TPL_ENABLE_Boost:BOOL=ON \
-D Boost_NO_SYSTEM_PATHS:STRING="True" \
-D Boost_NO_BOOST_CMAKE:STRING="True" \
-D CMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
-D Trilinos_VERBOSE_CONFIGURE:BOOL=OFF \
-DCMAKE_PREFIX_PATH="$LAPACK;$BOOST_DIR;$PNETCDF;$PHDF5;$MATIO" \
..

make -j 8
make install
