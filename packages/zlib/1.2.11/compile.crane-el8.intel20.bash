#!/bin/bash

#!/bin/bash

module load compiler/intel/20
make clean && make distclean
# -fPIC needed otherwise hdf5 build against libz.a  will fail
export CFLAGS="$CFLAGS -fPIC"
export FFLAGS="$CFLAGS -fPIC"
export CXXFLAGS="$CFLAGS -fPIC"
export F90CFLAGS="$CFLAGS -fPIC"

./configure --prefix=/util/opt/zlib/1.2.11/intel/19.1.3

make && make install
