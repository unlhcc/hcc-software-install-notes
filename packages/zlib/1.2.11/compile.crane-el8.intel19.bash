#!/bin/bash

#!/bin/bash

module load compiler/intel/19
make clean && make distclean
# -fPIC needed otherwise hdf5 build against libz.a  will fail
export CFLAGS="$CFLAGS -fPIC"
export FFLAGS="$CFLAGS -fPIC"
export CXXFLAGS="$CFLAGS -fPIC"
export F90CFLAGS="$CFLAGS -fPIC"

./configure --prefix=/util/opt/zlib/1.2.11/intel/19.0.1

make && make install
