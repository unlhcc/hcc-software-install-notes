#!/bin/bash

#!/bin/bash

module load compiler/intel/12
make clean && make distclean

# Use older GCC as system default 8.x is too new
export GXX_INCLUDE=/util/comp/gcc/4.9/include/c++/6.1.0
export CFLAGS="-gcc-name=/util/comp/gcc/4.9/bin/gcc -D__PURE_INTEL_C99_HEADERS__ -D_Float128=double"
export CXXFLAGS="-gxx-name=/util/comp/gcc/4.9/bin/g++ -D__PURE_INTEL_C99_HEADERS__  -D_Float128=double"

# -fPIC needed otherwise hdf5 build against libz.a  will fail
export CFLAGS="$CFLAGS -fPIC"
export FFLAGS="$CFLAGS -fPIC"
export CXXFLAGS="$CFLAGS -fPIC"
export F90CFLAGS="$CFLAGS -fPIC"

./configure --prefix=/util/opt/zlib/1.2.11/intel/12.1.6

make && make install
