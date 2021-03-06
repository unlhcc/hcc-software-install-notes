#!/bin/sh

module load compiler/intel/13 openmpi/1.6

export ESMF_OS=Linux
export ESMF_DIR=/util/src/ESMF/esmf 
export ESMF_INSTALL_PREFIX=/util/opt/ESMF/5.2.0rp3/openmpi/1.6/intel/13
export ESMF_COMM=openmpi
export ESMF_COMPILER=intel

make
make check
make install
