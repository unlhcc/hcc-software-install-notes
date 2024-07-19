#!/bin/bash

mkdir -p /util/opt/ssages/0.9.3-lammps/openmpi/4.0/gcc/9/

module purge
module load compiler/gcc/9 openmpi/4.0 automake/1.16 intel-mkl/19 git/2.40 python/2.7 cmake/3.20 boost/1.66

cd /util/opt/ssages/0.9.3-lammps/openmpi/4.0/gcc/9/

# https://github.com/SSAGESproject/SSAGES/issues/40
sed -i "s/git:/https:/g" hooks/lammps/CMakeLists.txt

mkdir build
cd build

cmake -DLAMMPS="29 Oct 2020" \
    -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpic++ \
    -DPython_EXECUTABLE:FILEPATH=/util/opt/anaconda/deployed-conda-envs/packages/python/envs/python-2.7/bin/python ..
make -j8

# Install additional standard/required LAMMPS packages after make
cd hooks/lammps/lammps-download-prefix/src/lammps-download/src/
make yes-KSPACE
make yes-MOLECULE
make yes-RIGID
# Running make yes-all gives errors

# SSAGES needs to be recompiled again
cd ../../../../../../
make

#SSAGES does not recognize cmake/make PREFIX/INSTALL directories
#SSAGES depeds on the strucutre of the hooks build directory
#The PATH is set to /util/opt/ssages/0.9.3-lammps/openmpi/4.0/gcc/9/build in the module file
