#!/bin/bash

# Building phenix
module load compiler/gcc/14  
module load anaconda
module load cuda/12.8
bash Phenix-2.0-5936-CUDA12-Linux-x86_64.sh -b -p /util/opt/phenix/2.0-5936-gpu/gcc/14/
