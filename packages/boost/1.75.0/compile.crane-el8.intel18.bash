#!/bin/bash

module purge
module load compiler/intel/18

./bootstrap.sh --prefix=/util/opt/boost/1.75.0/intel/18.0.6 --with-toolset=intel

./b2 --clean-all -n
./b2 --without-python --build-dir=`mktemp -d` toolset=intel install
