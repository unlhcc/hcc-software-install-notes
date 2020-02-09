#!/bin/bash

module load cuda/8.0
export CUDA_PATH=$CUDA_HOME
export CARLSIM4_INSTALL_DIR=/util/opt/carlsim/4.0/gcc/4.4.7
make
make install
