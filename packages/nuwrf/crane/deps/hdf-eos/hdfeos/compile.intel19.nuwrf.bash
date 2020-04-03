#!/bin/bash

# Patch configure script for SZIP_CC: https://github.com/Sharpie/homebrew-science/blob/master/scientific/hdf-eos2.rb
module purge
module load compiler/intel/19 openmpi/4.0
make clean && make distclean
PREFIX=/util/opt/nuwrf/v9/deps

export LD_LIBRARY_PATH=${PREFIX}/lib:${LD_LIBRARY_PATH}
export LIBRARY_PATH=${PREFIX}/lib:${LIBRARY_PATH}
export PATH=${PREFIX}/bin:$PATH
export CC=h4cc 
export CFLAGS="-fPIC -Df2cFortran $CFLAGS"
export CXXFLAGS="-fPIC $CXXFLAGS"
export FFLAGS="-fPIC $FFLAGS"
export F90FLAGS="-fPIC $F90FLAGS"

./configure --disable-shared --prefix=$PREFIX --with-jpg=${PREFIX} \
	--with-zlib=${PREFIX} --with-hdf4=${PREFIX} --with-szlib=${PREFIX}
make
make check
#make install
