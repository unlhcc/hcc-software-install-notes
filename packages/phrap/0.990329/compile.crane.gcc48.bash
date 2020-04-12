#!/bin/bash
# Compile script for Phrap.
#
# Last updated 5 Feb /2015 by JJMR
# recompiule with gcc/4.8 to be in sync with hmmer (as part of RepeatMasker)



# Edit makefile make sure $CC points to gcc. After loading module gcc/4.8 'cc' would (still) point to default gcc 4.4.7.....

module load compiler/gcc/4.8

mkdir -p /util/opt/BCRF/phrap/0.990329/gcc/4.8.2
CUR=`pwd`
cd /util/opt/BCRF/phrap
ln -s 0.990329 0.9
cd 0.9/gcc
ln -s 4.8.2 4.8
cd $CUR

make clean
make

# Copy all executables to deployment directory. Also requires matrices to be in same directory.
find . -perm /ugo=x -exec cp \{\} /util/opt/BCRF/phrap/0.990329/gcc/4.8.2 \;
cp PAM250 /util/opt/BCRF/phrap/0.990329/gcc/4.8.2
cp mat50 /util/opt/BCRF/phrap/0.990329/gcc/4.8.2
cp mat70 /util/opt/BCRF/phrap/0.990329/gcc/4.8.2
cp BLOSUM62 /util/opt/BCRF/phrap/0.990329/gcc/4.8.2
cp penalty2 /util/opt/BCRF/phrap/0.990329/gcc/4.8.2
cp BLOSUM50 /util/opt/BCRF/phrap/0.990329/gcc/4.8.2

rm -f /util/opt/BCRF/phrap/0.990329/gcc/4.8.2/*.bash
chmod a+r /util/opt/BCRF/phrap/0.990329/gcc/4.8.2/*

