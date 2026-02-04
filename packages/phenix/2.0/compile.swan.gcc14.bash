#!/bin/bash

# Building phenix
module load compiler/gcc/14  
module load anaconda
bash Phenix-2.0-5936-Linux-x86_64.sh -b -p /util/opt/phenix/2.0-5936/gcc/14/
