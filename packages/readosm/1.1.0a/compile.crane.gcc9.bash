#!/bin/bash

module purge
module load compiler/gcc/9 gdal/3.4 expat/2.2

./configure --prefix=/util/opt/readosm/1.1/gcc/9
make
make install
