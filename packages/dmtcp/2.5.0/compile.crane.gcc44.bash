#!/bin/bash

# gcc 4.4 is the default compiler on Crane
make clean
make distclean

./configure --enable-infiniband-support --enable-forked-checkpointing --prefix=/util/opt/dmtcp/2.5.0/gcc/4.4.7
