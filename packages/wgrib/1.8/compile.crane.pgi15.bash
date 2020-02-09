#!/bin/bash

module load compiler/pgi/15
# That's right, a single C file
pgcc wgrib.c -o wgrib -lm
