module load compiler/gcc/4.7 intel-mkl/12 openmpi/1.8

make clean && make distclean

./configure --prefix=/util/opt/plumed/2.3.0/gcc/4.7/openmpi/1.8

make && make install
