#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20

rm -f makefile.include && cp makefile.include.swan makefile.include

make veryclean

make all

# mkdir -p /util/opt/vasp/5.4.4/intel/20/openmpi/4.1/bin
# cp bin/* /util/opt/vasp/5.4.4/intel/20/openmpi/4.1/bin

