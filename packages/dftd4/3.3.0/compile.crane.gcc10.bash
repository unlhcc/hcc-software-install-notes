#!/bin/bash

module purge
module load compiler/gcc/10 intel-mkl/19 cmake meson

PREFIX=/util/opt/dftd4/3.3.0/gcc/10

rm -rf _build_gcc10
meson setup _build_gcc10 --prefix=$PREFIX -Dlapack=mkl
meson install -C _build_gcc10
