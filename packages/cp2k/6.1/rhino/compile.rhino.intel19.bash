#!/bin/bash

set -e

# Preparation:
# - Extract libint v1.1.4 into ../libint-1.1.4

source /util/opt/lmod/lmod/init/profile
module load compiler/intel/19 openmpi/4.0 intel-mkl/19

# Build libint, if necessary
if [ ! -f "../libint-1.1.4/lib/libint.a" ]; then
    pushd ../libint-1.1.4
    ./configure --with-libint-max-am=6 --with-libderiv-max-am1=5
    make -j $(nproc)
    pop
fi

export LIBINT_INC=$(pwd)/../libint-1.1.4/include
export LIBINT_LIB=$(pwd)/../libint-1.1.4/lib

#export LIBINT_INC=$(pwd)/../libint-2.6.0/include
#export LIBINT_LIB=$(pwd)/../libint-2.6.0/lib/.libs

make ARCH=Linux-x86-64-intel VERSION=popt realclean
make -j $(nproc) ARCH=Linux-x86-64-intel VERSION=popt
