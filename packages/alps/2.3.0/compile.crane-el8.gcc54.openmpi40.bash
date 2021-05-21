#!/bin/bash

# NOTE: apply the patch file in this directory before building the first time!
# set_zero.patch

rm -rf build && mkdir build && pushd build

PREFIX=/util/opt/alps/2.3.0/openmpi/4.0.2/gcc/5.4.0
module purge
module load compiler/gcc/5.4 openmpi/4.0 hdf5/1.8 fftw3/3.3 sqlite/3.33 cmake/3.17 intel-mkl/18
#export CXXFLAGS="$CXXFLAGS -fpermissive -std=c++98 -D_GLIBCXX_USE_CXX11_ABI=0"
export CXXFLAGS="$CXXFLAGS -fpermissive -std=c++11"

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DLAPACK_64_BIT=ON \
 -DALPS_BUILD_EXAMPLES=OFF \
 -DALPS_BUILD_TESTS=OFF \
 -DBoost_ROOT_DIR=/util/src/alps/alps-2.3.0-src-with-boost.2/boost \
 -DCMAKE_PREFIX_PATH="/util/opt/hdf5/1.8/gcc/5.4;/util/opt/szip/2.1.1/gcc/5.4;/util/opt/zlib/1.2/gcc/5.4;/util/opt/fftw3/3.3/gcc/5.4;/util/opt/sqlite/3.33/gcc/5.4;../boost" \
 -DALPS_BUILD_PYTHON=OFF \
 -DHDF5_INCLUDE_DIR=/util/opt/hdf5/1.8/gcc/5.4/include \
 -DHDF5_LIBRARIES="/util/opt/hdf5/1.8/gcc/5.4/lib/libhdf5_hl.so;/util/opt/hdf5/1.8/gcc/5.4/lib/libhdf5.so" \
 -DZLIB_LIBRARY="/util/opt/zlib/1.2/gcc/5.4/lib/libz.so" \
  ..


make -j 4 VERBOSE=1
#make install
