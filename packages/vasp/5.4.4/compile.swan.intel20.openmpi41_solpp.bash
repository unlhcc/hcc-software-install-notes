#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20


# copy sol++ scripts
# https://gitlab.com/cplaisance/vaspsol_pp
mv solvation_intel.F solvation.F
mv solvation.F src/
patch -p1 < vaspsol++-vasp_5.4.4.patch


rm -f makefile.include && cp makefile.include.swan makefile.include

make veryclean

make all

# mkdir -p /util/opt/vasp/5.4.4-solpp/intel/20/openmpi/4.1/bin
# cp bin/* /util/opt/vasp/5.4.4-solpp/intel/20/openmpi/4.1/bin
