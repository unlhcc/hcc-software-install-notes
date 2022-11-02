#!/bin/bash

rm -rf build && mkdir build && pushd build

# patch -p0 --dry-run -i 001-jaz.patch

PREFIX=/util/opt/relion/4.0.0-gpu/openmpi/4.0.0/gcc/10
module purge
module load compiler/gcc/10 openmpi/4.0 intel-mkl/20 cuda/11.4 zlib/1.2 libtiff/4.1 libpng/1.6 libjpeg/2.0 cmake 

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DMKLFFT=ON  \
  -DDoublePrec_ACC=OFF -DCUDA_ARCH=35 \
  -DTIFF_INCLUDE_DIR=$LIBTIFF/include -DTIFF_LIBRARY=$LIBTIFF/lib/libtiff.so \
  -DJPEG_INCLUDE_DIR=$LIBJPEG/include -DJPEG_LIBRARY=$LIBJPEG/lib/libjpeg.so \
  -DPNG_PNG_INCLUDE_DIR=$LIBPNG/include -DPNG_LIBRARY=$LIBPNG/lib/libpng.so \
  -DZLIB_INCLUDE_DIR=$ZLIB/include -DZLIB_LIBRARY=$ZLIB/lib/libz.so \
  -DBUILD_SHARED_LIBS=ON -DALTCPU=OFF -DGUI=OFF -DCUDA=ON ..

make -j 8
make install
