#!/bin/bash

module purge
module load compiler/intel/20 intel-mkl/20 cmake meson

PREFIX=/util/opt/dftd4/3.3.0/intel/19.1.8

rm -rf _build_intel20
meson setup _build_intel20 --prefix=$PREFIX -Dlapack=mkl
meson install -C _build_intel20
