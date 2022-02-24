#!/bin/bash

module purge
module load compiler/intel/19 gdal/3.4 expat/2.2

./configure --prefix=/util/opt/readosm/1.1/intel/19
make
make install
