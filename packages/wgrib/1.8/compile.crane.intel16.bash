#!/bin/bash

module load compiler/intel/16
icc wgrib.c -o wgrib -lm
