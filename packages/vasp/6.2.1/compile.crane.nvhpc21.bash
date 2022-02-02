#!/bin/bash

module purge
module load nvhpc/21.9

rm -f makefile.include && cp makefile_acc.include makefile.include
make veryclean
make all
