#!/bin/bash

module load compiler/gcc/4.9 openmpi/1.10 boost/1.55 phdf5/1.8 pnetcdf/4.4 matio/1.5

make clean && make distclean

bash do.configure
