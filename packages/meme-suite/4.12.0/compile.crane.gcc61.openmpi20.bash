#!/bin/bash

module load compiler/gcc/6.1 openmpi/2.0 perl/5.22 python/2.7 zlib/1.2

./configure --prefix=/util/opt/meme-suite/4.12.0/gcc/6.1.0/openmpi/2.0.0 --with-url=http://meme-suite.org --enable-build-libxml2 --enable-build-libxslt --enable-opt -with-mpidir=/util/opt/openmpi/2.0/gcc/6.1
make -j8
make test -j8
make install
