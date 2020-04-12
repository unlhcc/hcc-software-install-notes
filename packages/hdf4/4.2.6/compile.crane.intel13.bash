#!/bin/bash

module load compiler/intel/13 szip/2.1
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/util/opt/zlib/1.2.5/intel/13/lib
export INCLUDE=$INCLUDE:/util/opt/zlib/1.2.5/intel/13/include

make clean && make distclean

#export CFLAGS="-fPIC"
#export CXXFLAGS="-fPIC"
#export LIBS="-lm"

./configure --prefix=/util/opt/hdf4/4.2.6/intel/13 --with-szlib=/util/opt/szip/2.1/intel/13 --with-zlib=/util/opt/zlib/1.2.5/intel/13
