#!/bin/bash

PREFIX=/util/opt/emacs/24.5/gcc/4.4.7
make clean
make distclean
./configure --prefix=${PREFIX}
make -j 4
make check
#make install
