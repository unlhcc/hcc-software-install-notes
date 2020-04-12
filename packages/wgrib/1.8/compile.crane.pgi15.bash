#!/bin/bash

module load compiler/pgi/15
pgcc wgrib.c -o wgrib -lm
