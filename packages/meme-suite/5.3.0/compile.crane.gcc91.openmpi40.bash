#!/bin/bash

module load compiler/gcc/9.1 openmpi/4.0 perl/5.26 python/2.7 zlib/1.2

./configure --prefix=/util/opt/meme-suite/5.3.0/gcc/9.1.0/openmpi/4.0.2/ --enable-build-libxml2 --enable-build-libxslt --enable-opt -with-mpidir=/util/opt/openmpi/4.0/gcc/9.1/
# https://sourceforge.net/p/mummer/discussion/451664/thread/59ad55aa/#bf1b, for larger datasets
make CPPFLAGS="-O3 -DSIXTYFOURBITS" -j8
make test -j8
make install
