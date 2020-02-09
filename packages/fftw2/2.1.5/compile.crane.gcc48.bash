#!/bin/bash

module load compiler/gcc/4.8

export CFLAGS="$CFLAGS -fPIC"

./configure --prefix=/util/opt/fftw2/2.1/gcc/4.8 --enable-sse2 --enable-avx --enable-float --enable-sse

make 

make check

make install
