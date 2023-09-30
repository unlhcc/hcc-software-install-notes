#!/bin/bash

module purge
module load compiler/gcc/11 cuda/11.8 intel-mkl/20 gstreamer/1.22 cmake python/3.10
PYTHON=$(which python)
PREFIX=/util/opt/opencv/4.5.5/gcc/11

rm -rf build && mkdir build && pushd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DPYTHON3_EXECUTABLE=${PYTHON} \
      -DPYTHON_EXECUTABLE=/usr/bin/python \
      -DWITH_CUDA=ON -DWITH_GSTREAMER=ON \
      -DOPENCV_EXTRA_MODULES_PATH=/util/src/opencv/opencv_contrib-4.5.5/modules \
      -DCMAKE_PREFIX_PATH=/util/opt/anaconda/deployed-conda-envs/packages/gstreamer/envs/gstreamer-1.22.5 \
      -DWITH_FFMPEG=OFF \
      -DBUILD_PNG=ON -DBUILD_JPEG=ON -DBUILD_TIFF=ON -DBUILD_WEBP=ON -DBUILD_OPENJPEG=ON -DBUILD_JASPER=ON -DBUILD_OPENEXR=ON -DBUILD_ZLIB=ON \
      -DBUILD_TESTS=0 -DBUILD_DOCS=0 \
..
make -j 4
make install
