#!/bin/bash

source /util/opt/lmod/lmod/init/profile
module load compiler/intel/13 openmpi/1.8 intel-mkl/15 fftw3/3.3 libxc/2.2

cp /util/opt/libxc/2.2/intel/13/lib/libxc.a  /util/opt/libxc/2.2/intel/13/lib/libxcf90.a /util/src/elk/elk-4.3.6/src

./setip

vim make.inc
vim ./src/zfftifc.f90
comment out "call cfftnd(nd,n,sgn,z)"

make

