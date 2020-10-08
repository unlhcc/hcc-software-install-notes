#!/bin/bash

#PREFIX=/util/opt/netcdf-c/4.7.4/pgi/20.4

# for monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/pgi/20.4

module purge
module use /util/opt/hcc-modules/Common
ml load compiler/pgi/20 hdf5/1.12 cmake

# configure won't find the various libs using PGI unless we do this
export LDFLAGS="${LDFLAGS} -L/util/opt/szip/2.1.1/pgi/20/lib -L/util/opt/zlib/1.2.11/pgi/20/lib -L/util/opt/hdf5/1.12/pgi/20/lib"
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2/pgi/20/lib"

rm -rf build.pgi20 && mkdir -p build.pgi20
pushd build.pgi20
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DENABLE_LARGE_FILE_SUPPORT=ON -DCMAKE_BUILD_TYPE="Release" \
 -DCMAKE_PREFIX_PATH="/util/opt/szip/2.1.1/pgi/20;/util/opt/zlib/1.2.11/pgi/20;/util/opt/hdf5/1.12/pgi/20" \
 -DCMAKE_INSTALL_LIBDIR=lib ..

# The '-shared' option appears twice in the link.txt, which causes the linker to error out with a
# 'duplicate version tag `VERSION_1810`' message, so remove the first instance as a workaround.
sed -i s/-shared//   liblib/CMakeFiles/netcdf.dir/link.txt

make -j 4
make install

# build the static lib
popd
rm -rf build.pgi20.static && mkdir -p build.pgi20.static
pushd build.pgi20
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} -DENABLE_LARGE_FILE_SUPPORT=ON -DCMAKE_BUILD_TYPE="Release" \
 -DCMAKE_PREFIX_PATH="/util/opt/szip/2.1.1/pgi/20;/util/opt/zlib/1.2.11/pgi/20;/util/opt/hdf5/1.12/pgi/20" \
 -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_SHARED_LIBS=OFF ..
make -j 4
make install
