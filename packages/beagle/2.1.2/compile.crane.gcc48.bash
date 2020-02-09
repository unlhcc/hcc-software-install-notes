#!/bin/bash

make clean && make distclean

# CUDA not supported with gcc >=4.9
module load compiler/gcc/4.8 cuda/6.5 java/1.8

PREFIX=/util/opt/beagle/2.1.2/gcc/4.8.2
./configure --prefix=${PREFIX} --enable-openmp --with-cuda=/util/opt/cuda/6.5 --with-jdk=$JAVA_HOME

make
make install
