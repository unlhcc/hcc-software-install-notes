#!/bin/bash

# first run only
# patch -p0 < CharScanner.patch

module purge
module load compiler/pgi/20

PREFIX=/util/opt/antlr/2.7.7/pgi/20.4
#export CXXFLAGS="-DANTLR_REALLY_NO_STRCASECMP $CXXFLAGS" 
#export PYTHON=python3

./configure --prefix=$PREFIX \
      	    --enable-cxx \
            --disable-python \
            --enable-csharp \
            --disable-java
make
make install

#rm -rf lib/cpp/build && mkdir -p lib/cpp/build
#pushd lib/cpp/build
#cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
#make
#make install
