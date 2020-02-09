#!/bin/bash

module load compiler/intel/15
# That's right, a single C file
icc wgrib.c -o wgrib -lm
