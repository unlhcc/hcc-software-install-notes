#!/bin/bash

module purge
module load compiler/intel/19 openmpi/4.0 intel-mkl/19

rm -f makefile.include && cp makefile.intel19.ompi40.include makefile.include
make veryclean
make all
