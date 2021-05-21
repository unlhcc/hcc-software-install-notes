#!/bin/bash

module purge
module load compiler/gcc/7.1 openmpi/4.0 fftw3/3.3 picsar make python/3.8 phdf5/1.12

export LIBPXR=$PICSAR/lib
export HDF5_ROOT_DIR=$PHDF5
export PICSAR=TRUE
export FFTW3_LIB=$FFTW3/lib

make clean
make distclean
make env
make print-PICSAR
make print-LIBPXR
make print-FFTW3_LIB
make -j 4
