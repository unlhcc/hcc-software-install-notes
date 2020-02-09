#!/bin/bash

PREFIX=/util/opt/clustal-omega/1.2.1/gcc/4.4.7
ARGTABLE=/util/opt/argtable/2.13/gcc/4.4

./configure --prefix=$PREFIX CFLAGS="-I${ARGTABLE}/include" LDFLAGS="-L${ARGTABLE}/lib"
