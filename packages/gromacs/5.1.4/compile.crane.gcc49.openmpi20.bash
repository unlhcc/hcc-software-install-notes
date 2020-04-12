#!/bin/bash
module load compiler/gcc/4.9

module load openmpi/2.0

cd gromacs-5.1.4

mkdir build

cd build

cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DCMAKE_INSTALL_PREFIX=/util/opt/BCRF/GROMACS/5.1.4/gcc/4.9.2 -DGMX_MPI=on

make 

make check

make install

