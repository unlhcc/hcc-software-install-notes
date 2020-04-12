#!/bin/bash

module load compiler/intel/15 szip/2.1 zlib/1.2
make clean && make distclean

./configure --prefix=/util/opt/hdf4/4.2/intel/15.0.2 --with-szlib=/util/opt/szip/2.1/intel/15 --with-zlib=/util/opt/zlib/1.2/intel/15
