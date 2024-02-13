#!/bin/sh

module load compiler/intel/20 openmpi/4.0 python/3.9

cd /util/opt/epoch/4.19/intel/20/openmpi/4.0/epoch1d/
make clean
make COMPILER=intel MPIF90=mpifort

cd /util/opt/epoch/4.19/intel/20/openmpi/4.0/epoch2d/
make clean
make COMPILER=intel MPIF90=mpifort

cd /util/opt/epoch/4.19/intel/20/openmpi/4.0/epoch3d/
make clean
make COMPILER=intel MPIF90=mpifort

cd ..
make clean
