#!/bin/bash

module load compiler/intel/13

export CFLAGS="$CFLAGS -fPIC"

./configure --prefix=/util/opt/fftw2/2.1.5/intel/13.5 --enable-sse2 --enable-avx --enable-float --enable-sse

make 

make check

make install
