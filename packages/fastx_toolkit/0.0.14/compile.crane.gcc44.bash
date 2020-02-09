#!/bin/bash
# install instructions: http://hannonlab.cshl.edu/fastx_toolkit/install_centos.txt
# requires libgtextutils: https://github.com/agordon/libgtextutils/

make clean && make distclean
export PKG_CONFIG_PATH=/util/opt/libgtextutils/0.7/gcc/4.4/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=/util/opt/fastx_toolkit/0.0.14/gcc/4.4.7
