#!/bin/bash
  
module purge
module load compiler/intel/20 intel-mkl/20 openmpi/4.0 fftw3/3.3 libxc/5.2

mkdir -p /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/

sed -i 's/mpiifort/mpifort/g' make.inc
make clean
make all

cp ./src/grepelk /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/
cp ./src/vimelk /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/
cp ./src/protex /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/
cp ./src/rmspaces /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/
cp ./src/elk /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/
cp ./src/spacegroup/spacegroup /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/
cp ./src/eos/eos /util/opt/elk/9.5.1/intel/20/openmpi/4.0/bin/
