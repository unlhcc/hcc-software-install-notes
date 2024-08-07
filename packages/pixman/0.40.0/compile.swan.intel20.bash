#!/bin/bash

module purge
module load compiler/intel/20 zlib/1.2 libpng/1.6

PREFIX=/util/opt/pixman/0.40.0/intel/19.1
make clean
make distclean
./configure --prefix=$PREFIX --enable-libpng
make
# make install target broken from some test files that we don't really need
# do this as a workaround
make install-exec
make install-data
