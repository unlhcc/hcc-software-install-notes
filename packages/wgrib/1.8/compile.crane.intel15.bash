#!/bin/bash

module load compiler/intel/15
icc wgrib.c -o wgrib -lm
