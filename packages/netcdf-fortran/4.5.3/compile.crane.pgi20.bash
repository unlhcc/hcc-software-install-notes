#!/bin/bash

#PREFIX=/util/opt/netcdf-fortran/4.4.5/pgi/19.5
# for monolithic netcdf install
PREFIX=/util/opt/netcdf/4.7.4/pgi/20.4
module purge
ml load compiler/pgi/20 netcdf/4.7 hdf5/1.12 cmake

# configure won't find the various libs using PGI unless we do this
export LDFLAGS="${LDFLAGS} -L/util/opt/szip/2.1.1/pgi/20/lib -L/util/opt/zlib/1.2.11/pgi/20/lib -L/util/opt/hdf5/1.12/pgi/20/lib -L/util/opt/netcdf/4.7/pgi/20/lib"
# the netCDF build process doesn't seem to include the rpath
# for zlib by default
export LDFLAGS="${LDFLAGS} -Wl,-rpath=/util/opt/zlib/1.2.11/pgi/20/lib"

rm -rf build.pgi20 && mkdir -p build.pgi20
pushd build.pgi20
cmake  -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE="Release" \
 -DCMAKE_PREFIX_PATH="/util/opt/szip/2.1.1/pgi/20;/util/opt/zlib/1.2.11/pgi/20;/util/opt/hdf5/1.12/pgi/20;/util/opt/netcdf/4.7.4/pgi/20.4" \
 -DCMAKE_INSTALL_LIBDIR=lib -DHAVE_SZIP_WRITE=1 ..  # The HAVE_SZIP_WRITE test is broken with PGI, so force it to include support

make
make install

# same song, second verse since you can't build both shared and static libs at once
popd
rm -rf build.pgi20.static && mkdir -p build.pgi20.static
pushd build.pgi20.static
cmake  -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE="Release" \
 -DCMAKE_PREFIX_PATH="/util/opt/szip/2.1.1/pgi/20;/util/opt/zlib/1.2.11/pgi/20;/util/opt/hdf5/1.12/pgi/20;/util/opt/netcdf/4.7.4/pgi/20.4" \
 -DCMAKE_INSTALL_LIBDIR=lib -DHAVE_SZIP_WRITE=1 -DBUILD_SHARED_LIBS=OFF ..  # The HAVE_SZIP_WRITE test is broken with PGI, so force it to 1
make
make install
