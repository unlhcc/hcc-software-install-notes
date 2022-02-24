#!/bin/bash

module purge
module load compiler/intel/20 gdal/3.4 expat/2.2

./configure --prefix=/util/opt/readosm/1.1/intel/20
make
make install
