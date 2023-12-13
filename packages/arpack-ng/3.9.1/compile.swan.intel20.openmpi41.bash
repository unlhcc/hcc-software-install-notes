#!/bin/bash

module purge
module load compiler/intel/20 openmpi/4.1 intel-mkl/20 python/3.10 cmake make

export PREFIX=/util/opt/arpack-ng/3.9.1/openmpi/4.1/intel/20/

cd /util/src/arpack-ng/arpack-ng-3.9.1/

mkdir build
cd build

# compile with shared libs OFF (.a files)
make clean
cmake -DCMAKE_PREFIX_PATH=${PREFIX} -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_SHARED_LIBS=OFF -DICB=ON -DMPI=ON -DITF64SUFFIX="LP64" ..
make install

# compile with shared libs ON (.so files)
make clean
cmake -DCMAKE_PREFIX_PATH=${PREFIX} -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_SHARED_LIBS=ON -DICB=ON -DMPI=ON -DITF64SUFFIX="LP64" ..
make install
