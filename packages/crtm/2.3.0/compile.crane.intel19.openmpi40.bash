#!/bin/sh

module load compiler/intel/19 openmpi/4.0 netcdf/4.7

bash ./config-setup/ifort-debug.setup
./configure --prefix=/util/opt/crtm/2.3.0/intel/19.0.1/
make
make check
make install
