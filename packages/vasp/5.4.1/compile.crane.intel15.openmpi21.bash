#!/bin/bash

module load compiler/intel/15 openmpi/2.1 intel-mkl/15

make veryclean

make all
