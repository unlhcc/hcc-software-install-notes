#Compile script for pandaseq
#
# Last updated 20150831 by Stephanie Canny
# 

module load compiler/gcc/4.9

mkdir -p /util/opt/BCRF/pandaseq/2.9/gcc/4.9.2
CUR=`pwd`
cd /util/opt/BCRF/pandaseq/2.9/gcc
ln -s 4.9.2 4.9
cd $CUR

./autogen.sh
./configure --prefix=/util/opt/BCRF/pandaseq/2.9/gcc/4.9
make
make install

