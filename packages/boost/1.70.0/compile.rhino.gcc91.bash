#!/bin/bash

module load compiler/gcc/9.1

./bootstrap.sh --prefix=/util/opt/boost/1.70/gcc/9.1
./b2 install
