#!/bin/bash

module purge
module load compiler/gcc/7.1

./bootstrap.sh --prefix=/util/opt/boost/1.75.0/gcc/7.1.0

./b2 --clean-all -n
./b2 --without-python --build-dir=`mktemp -d` install
