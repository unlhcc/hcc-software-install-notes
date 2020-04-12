#!/bin/bash

#module load compiler/gcc/4.9 szip/2.1 zlib/1.2

#make clean && make distclean

#./configure --prefix=/util/opt/hdf4/4.2/gcc/4.9 --with-szlib=/util/opt/szip/2.1/gcc/4.9 --with-zlib=/util/opt/zlib/1.2/gcc/4.9

#!/bin/bash

# The configure script must be tweaked to get shared lib support enabled.
# Change line 12492 from
# if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \ 
# to
# if [ 1 -eq 1 ] \
# compete hack, but it works

module load compiler/gcc/4.9 szip/2.1 zlib/1.2
make clean && make distclean

./configure --prefix=/util/opt/hdf4/4.2/gcc/4.9.shlib --with-szlib=/util/opt/szip/2.1/gcc/4.9 --with-zlib=/util/opt/zlib/1.2/gcc/4.9 --enable-shared --disable-fortran --disable-netcdf
