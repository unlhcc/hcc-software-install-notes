#!/bin/bash


source /util/opt/lmod/lmod/init/profile
module load compiler/intel/16 openmpi/3.1 intel-mkl/15

make ARCH=Linux-x86-64-intelplumed VERSION=popt realclean

#DO NOT USE PARALLEL BUILD
make ARCH=Linux-x86-64-intelplumed VERSION=popt
