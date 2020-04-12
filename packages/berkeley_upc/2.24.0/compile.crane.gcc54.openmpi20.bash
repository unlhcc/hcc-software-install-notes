#!/bin/bash

module load compiler/gcc/5.4 openmpi/2.0

make clean && make distclean
../berkeley_upc-2.24.0/configure GUPC_TRANS=/util/comp/gnu-upc/5.2/bin/upc \
--prefix=/util/comp/upcr/2.24.0/openmpi/2.0.1/gcc/5.4.0 \
--with-multiconf=dbg_gupc,opt_gupc \
--with-multiconf-force=gupc \
--enable-sptr-struct \
--disable-aligned-segments
