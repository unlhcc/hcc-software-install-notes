#!/bin/bash

rm -rf build && mkdir build && pushd build

# patch -p0 --dry-run -i 001-tbb.patch

PREFIX=/util/opt/relion/4.0.0/openmpi/4.0.5/intel/20
module purge
module load compiler/intel/20 openmpi/4.0 intel-mkl/20 zlib/1.2 libtiff/4.1 libpng/1.6 libjpeg/2.0 intel-tbb/2021 cmake

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_PREFIX_PATH="$LIBTIFF:$LIBPNG:$LIBJPEG" \
    -DMKLFFT=ON -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc \
    -DMPI_C_COMPILER=mpicc -DMPI_CXX_COMPILER=mpicxx \
    -DTIFF_INCLUDE_DIR=$LIBTIFF/include -DTIFF_LIBRARY=$LIBTIFF/lib/libtiff.so \
    -DJPEG_INCLUDE_DIR=$LIBJPEG/include -DJPEG_LIBRARY=$LIBJPEG/lib/libjpeg.so \
    -DPNG_PNG_INCLUDE_DIR=$LIBPNG/include -DPNG_LIBRARY=$LIBPNG/lib/libpng.so \
    -DZLIB_INCLUDE_DIR=$ZLIB/include -DZLIB_LIBRARY=$ZLIB/lib/libz.so \
    -DCMAKE_C_FLAGS="-O3 -ip -g -xAVX -axCORE-AVX2,COMMON-AVX512 -restrict " \
    -DCMAKE_CXX_FLAGS="-O3 -ip -g -xAVX -axCORE-AVX2,COMMON-AVX512 -restrict " \
    -DBUILD_SHARED_LIBS=ON -DALTCPU=ON -DGUI=OFF -DCUDA=OFF ..

make -j 8
make install
