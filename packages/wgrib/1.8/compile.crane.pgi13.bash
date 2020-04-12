#!/bin/bash

module load compiler/pgi/13
pgcc wgrib.c -o wgrib -lm
