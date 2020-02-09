#!/bin/bash

module load compiler/gcc/4.9

./configure --prefix=/util/opt/tricubic/1.0/gcc/4.9

make

make install
