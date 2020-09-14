#!/bin/bash

module purge
module load compiler/pgi/20 zlib/1.2

PREFIX=/util/opt/libxml/2.9.9/pgi/20.4
cat /dev/null > elfgcchack.h
make clean
make distclean
./configure --prefix=$PREFIX --with-lzma=/util/opt/xzutils/5.2/pgi/20

# Edit the EXTRA_FLAGS line in the Makefile, removing all but the '-pedantic' option
#make
#make install
