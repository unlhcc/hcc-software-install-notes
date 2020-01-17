#!/bin/bash

OMPI_VERSION=3.1.3
COMPILER=pgi
for VERSION in 12.10 13.10 14.7 15.10
  do
	SHORTVER=`echo $VERSION | cut -f 1 -d '.'`
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
