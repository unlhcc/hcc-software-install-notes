#!/bin/bash

module load compiler/gcc/4.9
PREFIX=/util/opt/gtk+/3.22/gcc/4.9.2

./configure --prefix=${PREFIX}
