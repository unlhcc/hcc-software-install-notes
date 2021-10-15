#!/bin/bash
# This is for Environ 2.0 For Environ 1.1 the procedure is different and is provided at https://environ.readthedocs.io/en/latest/install/preliminary_steps.html
make clean && make distclean
module purge
module load compiler/intel/20  intel-mkl/20 openmpi/4.0
git clone https://github.com/environ-developers/Environ.git
./configure --prefix=/util/opt/espresso-Environ/6.7/openmpi/4.0/intel/20.0
cd Environ
./configure
make install
# select the QE package you wish to work with
#select the number of cores for parallel compilation (default = 1)
