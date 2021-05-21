#!/bin/bash

module purge
module load compiler/intel/19

./bootstrap.sh --prefix=/util/opt/boost/1.75.0/intel/19.0.1 --with-toolset=intel

./b2 --clean-all -n
./b2 --without-python --build-dir=`mktemp -d` toolset=intel install
