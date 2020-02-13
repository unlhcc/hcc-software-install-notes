#!/bin/bash

module load compiler/gcc/9.1 openmpi/4.0 perl/5.26

./configure --prefix=/util/opt/meme-suite/5.1.1/gcc/9.1.0/openmpi/4.0.1/ --enable-build-libxml2 --enable-build-libxslt --enable-opt -with-mpidir=/util/opt/openmpi/4.0/gcc/9.1/
make -j8
make test -j8
make install
