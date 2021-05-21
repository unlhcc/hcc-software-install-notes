#!/bin/bash

module purge
module load compiler/intel/19 zlib/1.2 bzip2/1.0 xzutils/5.2 curl/7.76

PREFIX=/util/opt/htslib/1.12/intel/19.0.8

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
