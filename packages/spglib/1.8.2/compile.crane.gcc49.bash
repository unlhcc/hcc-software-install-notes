#!/bin/bash

module load compiler/gcc/4.9

./configure --prefix=/util/opt/spglib/1.8/gcc/4.9

make 

make install
