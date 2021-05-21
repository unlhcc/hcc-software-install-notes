#!/bin/bash

module purge
module load compiler/gcc/10.2 zlib/1.2 bzip2/1.0 xzutils/5.2 curl/7.76

PREFIX=/util/opt/htslib/1.12/gcc/10.2.0

make clean && make distclean
./configure --prefix=$PREFIX
make
make install
