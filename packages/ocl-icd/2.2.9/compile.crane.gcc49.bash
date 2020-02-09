#!/bin/bash

PREFIX=/util/opt/ocl-icd/2.2.9/gcc/4.9.2

module load compiler/gcc/4.9
./configure --prefix=${PREFIX} --enable-official-khronos-headers
make
