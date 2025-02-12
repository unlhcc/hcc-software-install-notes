#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20


# copy r2scan-subroutines scripts
# https://gitlab.com/dhamil/r2scan-subroutines
cd src
wget https://gitlab.com/dhamil/r2scan-subroutines/-/raw/master/cscan.f
wget https://gitlab.com/dhamil/r2scan-subroutines/-/raw/master/xscan.f
wget https://gitlab.com/dhamil/r2scan-subroutines/-/raw/master/vasp_patch_files/metagga544.diff
patch < metagga544.diff
cd ..


rm -f makefile.include && cp makefile.include.swan makefile.include

make veryclean

make all

# mkdir -p /util/opt/vasp/5.4.4-r2scan/intel/20/openmpi/4.1/bin
# cp bin/* /util/opt/vasp/5.4.4-r2scan/intel/20/openmpi/4.1/bin

