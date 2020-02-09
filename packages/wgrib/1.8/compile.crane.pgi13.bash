#!/bin/bash

module load compiler/pgi/13
# That's right, a single C file
pgcc wgrib.c -o wgrib -lm
