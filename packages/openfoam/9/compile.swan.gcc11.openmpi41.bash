#!/bin/bash

module load compiler/gcc/11
module load openmpi/4.1
module load binutils/2.30
module load flex/2.6
module load git

cd /util/opt/openfoam/9/gcc/11/openmpi/4.1.3
# use the Git repo, the tarballs have missing headers
git clone https://github.com/OpenFOAM/ThirdParty-9.git
git clone https://github.com/OpenFOAM/OpenFOAM-9.git

source /util/opt/openfoam/9/gcc/11/openmpi/4.1.3/OpenFOAM-9/etc/bashrc

cd ThirdParty-9/
./Allclean
./Allwmake -j 8
cd ..
cd OpenFOAM-9/
./Allwmake -j 8
