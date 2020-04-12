#!/bin/bash
# Compile script for HMMER 3.1b1.
#
# Last updated 27/1/2015 by JJMR

mkdir -p /util/opt/BCRF/hmmer/3.1b1
ln -s /util/opt/BCRF/hmmer/3.1b1 /util/opt/BCRF/hmmer/3.1


./configure --prefix=/util/opt/BCRF/hmmer/3.1b1/
make
make check
make install
