#!/bin/bash

module purge
module load compiler/intel/19 intel-mkl/19 cmake meson

PREFIX=/util/opt/dftd4/3.3.0/intel/19.0.8

rm -rf _build_intel19
meson setup _build_intel19 --prefix=$PREFIX -Dlapack=mkl
meson install -C _build_intel19
