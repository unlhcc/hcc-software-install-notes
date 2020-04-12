#!/bin/bash
# Compile script for Phrap.
#
# Last updated 21/1/2015 by JJMR



# Edit makefile make sure $CC points to gcc. After loading module gcc/4.8 'cc' would (still) point to default gcc 4.4.7.....

#module load compiler/gcc/4.8
mkdir -p /util/opt/BCRF/phrap/0.990329
CUR = `pwd`;
cd /util/opt/BCRF/phrap 
ln -s /util/opt/BCRF/phrap/0.990329 0.9
cd $CUR

make clean
make

# Copy all executables to deployment directory. Also requires matrices to be in same directory.
find . -perm /ugo=x -exec cp \{\} /util/opt/BCRF/phrap/0.9/ \;
cp PAM250 /util/opt/BCRF/phrap/0.9/
cp mat50 /util/opt/BCRF/phrap/0.9/
cp mat70 /util/opt/BCRF/phrap/0.9/
cp BLOSUM62 /util/opt/BCRF/phrap/0.9/
cp penalty2 /util/opt/BCRF/phrap/0.9/
cp BLOSUM50 /util/opt/BCRF/phrap/0.9/

rm /util/opt/BCRF/phrap/0.9/compile.gcc-4-4-7.bash

