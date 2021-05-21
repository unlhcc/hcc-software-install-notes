#!/bin/bash

module purge
module load compiler/gcc/5.4
export LD_LIBRARY_PATH=/util/opt/zlib/1.2/gcc/5.4/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/util/opt/zlib/1.2/gcc/5.4/lib:$LIBRARY_PATH
export CPATH=/util/opt/zlib/1.2/gcc/5.4/include:$CPATH

PREFIX=/util/opt/sqlite/3.33.0/gcc/5.4.0
make clean
make distclean
./configure --prefix=$PREFIX
make
make install
