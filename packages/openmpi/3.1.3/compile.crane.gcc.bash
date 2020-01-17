#!/bin/bash

OMPI_VERSION=3.1.3
COMPILER=gcc
for VERSION in 4.9.2 5.4.0 6.1.0 7.1.0 8.2.0
  do
	SHORTVER=`echo $VERSION | cut -f 1-2 -d '.'`
	make clean && make distclean
 	module purge
 	module load compiler/${COMPILER}/${SHORTVER}
	PREFIX=/util/opt/openmpi/${OMPI_VERSION}/${COMPILER}/${VERSION}	
	./configure     --prefix=$PREFIX \
	                --with-hwloc=internal \
	                --enable-mpirun-prefix-by-default \
	                --with-slurm \
	                --with-verbs \
	                --with-psm \
	                --with-psm2=/usr \
	                --with-knem=/opt/knem-1.1.2.90mlnx1 \
	                --with-cma
 	make -j 8 install
  done
