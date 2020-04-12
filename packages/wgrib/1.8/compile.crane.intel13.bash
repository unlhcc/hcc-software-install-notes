#!/bin/bash

module load compiler/intel/13
icc wgrib.c -o wgrib -lm
