#!/bin/bash

PREFIX=/util/opt/wgrib/1.8/intel/20
module load compiler/intel/20
# That's right, a single C file
icc wgrib.c -o wgrib -lm
mkdir -p ${PREFIX}/bin
cp -afv wgrib ${PREFIX}/bin
