#!/bin/bash

module load compiler/gcc/4.9 openmpi/1.8

make clean && make distclean
../berkeley_upc-2.20.0/configure GUPC_TRANS=/util/comp/gnu-upc/4.9.0.1/bin/upc  --prefix=/util/comp/upcr/2.20.0 --with-multiconf=dbg_gupc,opt_gupc --with-multiconf-force=gupc 
