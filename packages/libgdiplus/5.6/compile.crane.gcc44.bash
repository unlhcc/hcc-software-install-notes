#!/bin/bash

make clean && make distclean

./autogen.sh --without-libexif --prefix=/util/opt/libgdiplus/5.6/gcc/4.4.7
