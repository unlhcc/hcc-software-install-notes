#!/bin/bash

module load compiler/gcc/4.9 zlib/1.2
PREFIX=/util/opt/glib/2.50.0/gcc/4.9.2

make clean
make distclean
./configure --prefix=${PREFIX} --disable-libmount --with-pcre=internal
make
make check
