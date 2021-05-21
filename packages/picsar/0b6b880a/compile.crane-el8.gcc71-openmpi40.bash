#!/bin/bash

module purge
module load compiler/gcc/7.1 openmpi/4.0 fftw3/3.3

# No version info, so use the short hash
VERSION=`git rev-parse --short HEAD`

# No install target, so do it manually. This is why we can't have nice things.
PREFIX=/util/opt/picsar/$VERSION/openmpi/4.0.5/gcc/7.1.0
mkdir -p $PREFIX/bin $PREFIX/lib $PREFIX/include

# -fallow-argument-mismatch has to be added:  https://gcc.gnu.org/gcc-10/changes.html
# patch -p0 <fflags.patch

# FFTW3 is set by the module
export FFTW3_INCLUDE=$FFTW3/include
export FFTW3_LIB=$FFTW3/lib

# Have to run make clean in-between different targets. Don't look at me, I just work here.
make clean
make VERBOSE=1 FFTW3_LIB=$FFTW3/lib FFTW3_INCLUDE=$FFTW3/include MODE=library lib
cp -a lib/* $PREFIX/lib

make clean
make VERBOSE=1 FFTW3_LIB=$FFTW3/lib FFTW3_INCLUDE=$FFTW3/include MODE=prod
cp fortran_bin/picsar $PREFIX/bin

make clean
make VERBOSE=1 FFTW3_LIB=$FFTW3/lib FFTW3_INCLUDE=$FFTW3/include MODE=prod
cp fortran_bin/picsar $PREFIX/bin/picsar.spectral
