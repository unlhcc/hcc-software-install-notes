#!/bin/bash

module purge
module load compiler/gcc/8.2
PREFIX=/util/opt/openblas/0.3.18/gcc/8.2

make clean
make PREFIX=$PREFIX TARGET=SANDYBRIDGE DYNAMIC_ARCH=1 USE_OPENMP=1 NUM_THREADS=128 -j 4
make PREFIX=$PREFIX TARGET=SANDYBRIDGE DYNAMIC_ARCH=1 USE_OPENMP=1 NUM_THREADS=128 -j 1 install
pushd $PREFIX && ln -s libopenblas.so libblas.so