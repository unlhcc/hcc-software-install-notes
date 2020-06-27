#!/bin/bash

module load compiler/gcc/9.1
module load openmpi/4.0
module load binutils/2.30
module load git

cd /util/opt/openfoam/7/gcc/9.1.0/openmpi/4.0.2
# use the Git repo, the tarballs have missing headers
git clone https://github.com/OpenFOAM/ThirdParty-7.git
git clone https://github.com/OpenFOAM/OpenFOAM-7.git

source /util/opt/openfoam/7/gcc/9.1.0/openmpi/4.0.2/OpenFOAM-7/etc/bashrc

cd ThirdParty-7/
./Allclean
./Allwmake -j 8
cd ..
cd OpenFOAM-7/
./Allwmake -j 8
