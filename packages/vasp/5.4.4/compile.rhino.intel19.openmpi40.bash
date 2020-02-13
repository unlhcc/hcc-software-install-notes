#!/bin/bash

module load compiler/intel/19 openmpi/4.0 intel-mkl/19

make veryclean

make all
