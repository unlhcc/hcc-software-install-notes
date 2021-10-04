#!/bin/bash

module purge
module load compiler/gcc/9.1 openmpi/3.1 metis/4.0 intel-mkl/19 petsc/3.2 boost/1.66 scons/py39/4.2
scons -c
scons -j4 test=1 debug=0
