#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20 fftw3/3.3 libxc/5.2 libint/2.6 plumed/2.8 libxsmm/1.17 spglib/2.0
PREFIX=/util/opt/cp2k/2023.1/openmpi/4.1.3/intel/20
ARCH=Linux-x86-64-swan
mkdir -p ${PREFIX}/bin

make clean && make distclean
make ARCH=${ARCH} VERSION=psmp -j 4 || exit 1
ln -s -r exe/${ARCH}/cp2k.psmp exe/${ARCH}/cp2k
cp -a exe/${ARCH}/* ${PREFIX}/bin
cp -R data ${PREFIX}
