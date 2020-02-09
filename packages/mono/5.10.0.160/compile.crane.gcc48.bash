#!/bin/bash

# NOTE!!!!!
# Building Mono requires mono, so the easiest thing to do is build inside a Docker instance
# Install an old Mono version from EPEL and use that
module load compiler/gcc/4.8 cmake/3.10 binutils/2.30
make clean && make distclean
export LD_LIBRARY_PATH=/util/opt/libgdiplus/5.6/gcc/4.4/lib:$LD_LIBRARY_PATH
./configure --prefix=/util/opt/mono/5.10.0.160/gcc/4.8.3 --with-libgdiplus=/util/opt/libgdiplus/5.6/gcc/4.4/lib/libgdiplus.so --with-csc=mcs
