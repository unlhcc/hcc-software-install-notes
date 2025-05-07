#!/bin/bash
  
module purge
module load compiler/intel/2024

export CC=icx
export FC=ifx
export F77=ifx
export FCFLAGS="-march=haswell -mtune=icelake-server"
export LDFLAGS="-lifcoremt -lifport -limf -lsvml -lirc -lirc_s -lpthread -ldl"

# Clean previous attempts
make clean
make distclean

# Run configure manually setting FCLIBS (not just LDFLAGS)
./configure \
  CC=icx \
  FC=ifx \
  F77=ifx \
  FCLIBS="$LDFLAGS" \
  --prefix=/util/opt/libxc/5.1.6/intel/2024 \
  --enable-shared

make -j 4
make install
~            
