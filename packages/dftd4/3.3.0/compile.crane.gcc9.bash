#!/bin/bash

module purge
module load compiler/gcc/9 intel-mkl/19 cmake meson

PREFIX=/util/opt/dftd4/3.3.0/gcc/9

rm -rf _build_gcc9
meson setup _build_gcc9 --prefix=$PREFIX -Dlapack=mkl -Dapi_v2=true
meson install -C _build_gcc9
